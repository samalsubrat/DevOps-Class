#!/bin/bash

cat "$1" | sed 's/ *, */,/g' | sed 's/^ *//g' | sed 's/ *$//g'
