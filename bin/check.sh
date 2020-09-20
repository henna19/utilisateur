#! /bin/bash

while true;
do
	cd ~/src
	dir=$(pwd)

	sudo chmod +r $dir/utilisateur/list.xls
	sudo chmod +r $dir/utilisateur/bin/converted.csv

	xls2csv $dir/utilisateur/list.xls > $dir/utilisateur/bin/converted.csv

	input="$dir/utilisateur/bin/converted.csv"

	array=($(awk -F: '{ print $1 }' /etc/passwd ))
	i=0;
	while IFS= read -r line
	do
		i=0
		for item in ${array[*]}
		do

		
	    		if [ "$line" = "\"$item\"" ]; then
	 			i=$((i+1))
			fi
		done
		if [ "$i" = 0 ]; then
			var="$(echo $line | sed 's/\"//g')"
			sudo useradd $var
			sudo mkhomedir_helper $var
		fi	
	done < "$input"
done
