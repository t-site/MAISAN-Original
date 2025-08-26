#!/bin/sh
(
	( sleep .001 && echo -n '8' ) &
	( sleep .001 && echo -n '2' ) &
	( sleep .001 && echo -n '4' ) &
	( sleep .001 && echo -n '1' ) &
	wait
)
