#! /bin/bash 

echo "Welcome To Our Litile CMS"

declare -A users=(["ahmed"]="123" ["mohamed"]="456") # Associative Array

select opt in login register DirBrute GetIp ManageFiles Quit 
do 
   if [ "$opt" == "login" ]
   then 
   	read -p"Enter Your Username: " usr
   	read -p "Enter Your Password: " pass 
   	if [ "$pass" == "${users["$usr"]}" ]
   	then
            echo "Welcome $usr" 
        else
            echo "Either Password or Username Incorrect" 
        fi
   elif [ "$opt" == "register" ] 
   then 
	 
	read -p "Enter Username: " usr
	read -p "Enter Password: " pass
	if [ "${users["$usr"]}" ] 
	then 
	   echo "This Username Already Used"
	else 
	   users[$usr]=$pass
	   echo "Registered Succssufully"

	fi
   elif [ "$opt" == "DirBrute" ] 
   then 
       read -p "Enter URL: " url
       for word in $(cat wordlist)
       do
          echo /$word
          curl "$url/$word.php" | grep HTTP | cut -d " " -f2
       done
   elif [ "$opt" == "GetIp" ]
   then 
       curl -s  https://wtfismyip.com/json | jq  -r '"Your IP Address Is: " +.YourFuckingIPAddress+"\nYour Country Code: " +.YourFuckingCountryCode'
   elif [ "$opt" == "ManageFiles" ]
   then 
        read -p "Enter File Name: " file
        if [ -e "$file" ]
        then 
          if [ -f "$file" ] 
            then 
               echo "$file Is a file "
          else 
               echo "$file Is a directory"
           fi
        else 
          echo "File Not Exits!!"
        fi
   elif [ "$opt" == "Quit" ]   
   then
	exit
   fi
 done
 
