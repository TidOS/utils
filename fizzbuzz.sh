#!/bin/bash
# count to 100, print numbers that are multiples of 3 with "fizz"
# multiples of 5 with "buzz" and multiples of both "fizzbuzz"

for i in {1..100}
do
	if [[ $i%15 -eq 0 ]]
	then
		echo "$i: Fizzbuzz"
	elif [[ $i%3 -eq 0 ]]
	then
		echo "$i: Fizz"
	elif [[ $i%5 -eq 0 ]]
	then
		echo "$i: Buzz"
	else
		echo $i
	fi
done
