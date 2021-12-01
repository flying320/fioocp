#!/bin/sh

mkdir -p /fioconf/jobs
mkdir -p /fioconf/jobs/todo
mkdir -p /fioconf/jobs/inprogress
mkdir -p /fioconf/jobs/done
mkdir -p /fioconf/results

while true
do
        cd /fioconf/jobs/todo
        for file in `ls  2>/dev/null`
        do
                DAT=`date +%y%m%d_%H%M%S`
                echo "Progressing file $file"
                cd /fioconf/jobs/todo
                mv $file /fioconf/jobs/inprogress
                cd /fioconf/jobs/inprogress

                /usr/bin/fio --output=/fioconf/results/${file}.${DAT}.json --output-format=json  $file
                sleep 60

                mv $file /fioconf/jobs/done
        done

        echo "No fio job file found"
        sleep 60
done
