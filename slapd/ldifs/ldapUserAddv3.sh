#!/bin/bash

# FirstName, UserName, UIDNumber, E-Mail
echo "dn: uid=$2,ou=People,dc=4wxyz,dc=com
uid: $2
cn: $1
sn: $1
objectClass: top
objectClass: person
objectClass: organizationalPerson
objectClass: inetorgperson
objectClass: posixAccount
givenName: $1
mail: $4@4wxyz.com
gecos: $1
loginShell: /bin/bash
uidNumber: $3
gidNumber: $3
homeDirectory: /home/$2
userPassword: {SSHA}UZrWRlhxpXK+aAfPGz5B+wloR+Iaw9TV
description: User Create" > .tmp/$2-user.ldif

#DATA Insert
docker exec openldap ldapmodify -a -x \
-D cn=admin,dc=4wxyz,dc=com \
-H ldap://127.0.0.1 \
-w ldappassword \
-f /container/service/slapd/assets/custome/.tmp/$2-user.ldif

#DATE Search
echo "DATE Search :"
docker exec openldap ldapsearch -x -b dc=4wxyz,dc=com -D "cn=admin,dc=4wxyz,dc=com" -w ldappassword -LLL -Z dn | egrep $2
