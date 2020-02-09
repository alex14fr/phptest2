Dockerfile 
- build
  -  récupère une image alpine
  -  installe paquets et binaire femail
  -  modifie fichiers de config en tant que root
  -  fin du build
 - run 
  - appelle /persist/update_htdocs du repository phptest2-persist
  - lance httpd
  
 update_htdocs
 - met à jour le code du wiki depuis wiki-mn stocké dans /persist
 - le copie dans htdocs
 
 ```sh
 #!/bin/sh

set -x
cd /persist/code
git pull
cp -a * .ht* /var/www/localhost/htdocs/
cd /var/www/localhost/htdocs
rm index.html Dockerfile README.md
[ -d data ] || ln -s /persist/data
[ -d pecnum ] || ln -s /persist/pecnum
```

 
 
stockage /persist
 -  ./oc get pvc
 -  ./oc volume dc/phptest2
 -  ./oc set volume dc/phptest2 --add --name=vol1 -t pvc --claim-size=20G -m /persist
 - pour redim
   - creer nouveau vol à monter dans /persist2
   - dans un rsh faire le mv /persist vers /persist2
   - ./oc volume dc/phptest2  --remove --name=vol1-ancien
   - ./oc volume dc/phptest2  --remove --name=vol1-nouveau
   - ./oc volume dc/phptest2  --claim-name=pvc/pvc-rsfsm -m /persist
   - * Once the OKD administrator has created a StorageClass with allowVolumeExpansion set to true ? *
- * conf de okd pas de stockage nfs dispo dans la console web ? *
- * stockage nfs le mieux pour ce que je veux faire ? *
   
commande oc
  - /lib/ld-musl-x86_64.so.1 /usr/local/bin/oc login --certificate-authority=/etc/ssl/cert.pem  ...
  - /lib/ld-musl-x86_64.so.1 /usr/local/bin/oc ...
     

conf/conf.php à éditer dans persist
genarchive


buildconfig -> (build) -> image
deploymentconfig + image -> pod - container
route <-> service
* routes non-TLS pas dispos ? routes non HTTP(S?) ? *
persistentvolumeclaim





### License

Copyright 2020 Alexandre Janon

Permission to use, copy, modify, and/or distribute this software for any purpose with or without fee is hereby granted, provided that the above copyright notice and this permission notice appear in all copies.

THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
