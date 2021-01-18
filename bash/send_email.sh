#! /bin/bash

# 1) change the /etc/ssmtp/ssmtp.conf
#root=<username>@gmail.com
#mailhub=smtp.gmail.com:587
#AuthUser=<username>@gmail.com
#AuthPass=<pass>
#UseSTARTTLS=yes
# 2) turn on a setting in Less secure app access of you mailbox

echo "Emails"

ssmtp mikalai.hryb@gmail.com

echo "Done"

# To: <email>
# From: <email>
# Cc: <email>
# Subject: <text>
# <body>
