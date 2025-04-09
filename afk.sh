#!/bin/sh -

MINS=30
LOOPS=1
SLEEP_MINS=15
[ $# -ge 1 ] && MINS=$1
if [ $# -ge 2 ]; then
	[ "$2" -gt 0 ] && LOOPS=$2
fi
if [ $# -eq 3 ]; then
	[ "$3" -gt 0 ] && SLEEP_MINS=$3
fi
[ $# -gt 3 ] && echo "too many args" && exit 1;

for ((i=0; i < ${LOOPS}; i++)); do
	afk "Work" -p 5 -t 0 -z -0 -c "Purple" -M "${MINS}"
	[ $? -gt 0 ] && exit 1
	afk "Break" -p 5 -t 0 -z -0 -c "Red" -M "${SLEEP_MINS}"
done
