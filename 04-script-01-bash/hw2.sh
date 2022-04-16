#!/usr/bin/env bash

i=0
n=2000
while ((1==1))
do
  i=$(($i+1))
	curl http://localhost:4757
	if (($?!=0))
	then
		date >> curl.log
	else
	  echo "All done! It works!" >> curl.log
	  date >> curl.log
    sleep 5  #  добавил sleep для того чтобы успеть сделать скрин экрана
	  exit
	fi

	if (($(stat -c%s "curl.log")>$n))
	then
    sed -i '1,15d' curl.log
    echo 'Deleting 15 old records.'
	fi
done
