#!/usr/bin/env bash
a=1
b=2
i=0
c=a+b
echo "c=a+b ->" $c
d=$a+$b
echo "d=\$a+\$b ->" $d
e=$(($a+$b))
echo "e=\$((\$a+\$b)) ->" $e
sleep 2
