#!/bin/bash
find ./*.log -mtime -7 -exec rm {} \;
