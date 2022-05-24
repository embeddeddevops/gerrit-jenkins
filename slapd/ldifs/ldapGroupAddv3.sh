#!/bin/bash

# GroupName
echo "dn: cn=$1,ou=Groups,dc=4wxyz,dc=com
changetype: add
objectClass: top
objectClass: posixGroup
#objectClass: groupOfUniqueNames
gidNumber: 2345
cn: $1
#uniqueMember: <DN of member>
#memberUid: 1501
description: groups" > .tmp/$1-group.ldif

#DATA Insert
docker exec openldap ldapmodify -a -x \
-D cn=admin,dc=4wxyz,dc=com \
-H ldap://127.0.0.1 \
-w ldappassword \
-f /container/service/slapd/assets/custome/.tmp/$1-group.ldif

#DATE Search
echo "DATE Search :"
docker exec openldap ldapsearch -x -b dc=4wxyz,dc=com -D "cn=admin,dc=4wxyz,dc=com" -w ldappassword -LLL -Z dn | egrep $1
