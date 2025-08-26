#!/bin/bash

function RD()
{
	A=$( . ./s.sh | . ./r.sh )
	B=$( . ./s.sh | . ./r.sh )
	C=$( . ./s.sh | . ./r.sh )
	D=$( . ./s.sh | . ./r.sh )
	E=$( . ./s.sh | . ./r.sh )
	F=$( . ./s.sh | . ./r.sh )
	echo $(( ( A * B + C ) + ( D + E + F ) ))
}

TMP=$( mktemp )
shuf $@ > $TMP

while read input
do
	lines=$( cat $TMP | wc -l )
	RD=$( RD )
	L=$(( RD % lines ))


	[ $L -gt $lines ] && L=$(( L - lines ))
	[ $L -lt 1 ] && L=$(( L + lines ))

	head -$L $TMP | tail -1
	[ "$input" = "quit" ] && break
done

rm $TMP
