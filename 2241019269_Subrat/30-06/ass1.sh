#!/bin/bash

if systemctl is-active --quiet nginx; then
	echo "Nginx is running"
else
	echo "Nginx is not running"
	sudo systemctl start nginx
	echo "Nginx has now started"
fi
