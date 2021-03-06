#!/bin/bash

cd /tmp
wget https://raw.githubusercontent.com/redoracle/fail2ban/main/release-versions/fail2ban-latest.txt; \
FAIL2BAN_VERSION=$(cat fail2ban-latest.txt) ;
TZ="UTC" ;
curl -SsOL "https://github.com/fail2ban/fail2ban/archive/${FAIL2BAN_VERSION}.zip";
unzip ${FAIL2BAN_VERSION}.zip 
cd fail2ban-${FAIL2BAN_VERSION} 
2to3 -w --no-diffs bin/* fail2ban 
python3 setup.py install 
