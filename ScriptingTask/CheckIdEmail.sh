#!/bin/sh


echo "John john@domain.com 325
Susan 510
Jane jane@domain.com 131
Karl karl@domain.com
Bert bert@localhost 150" > ./test.txt

 

while read line

do

ID=$(echo "$line" | awk '{print $NF}')

#echo $ID

if ! [[ $ID =~ ^[0-9]+$ ]]

    then

        continue;

else

if [ `expr $ID % 2` == 0 ]

then

        type=$(echo "even")

else

        type=$(echo "odd")

fi

fi

Email=$(echo "$line" | awk '{print $2}')

host=$(echo  $Email |awk -F'[@]' '{print $2}')

if [ "$host" != "${host/.}" ]

then accepted_email=$(echo $Email)

else

        continue;

fi

echo "The $ID of $accepted_email is $type"

done < ./test.txt
