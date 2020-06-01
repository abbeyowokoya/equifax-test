#!/bin/bash
yum install httpd -y
echo '<h1> EQUIFAX THE JOB IS DONE! </h1>' > /var/www/html/index.html
systemctl enable httpd
systemctl start httpd
