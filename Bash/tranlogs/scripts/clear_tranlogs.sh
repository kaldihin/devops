#!/bin/bash

if [[ `id -u` -ne 0 ]]
  then echo "You have little rights"
  exit 1
fi


if [[ ${#} -eq 0 || ${1} != 'ftlo' && ${1} != 'ftnlo' && ${1} != 'ftwps' && ${1} != 'ntlo' && ${1} != 'ntnlo' && ${1} != 'ntwps' && ${1} != 'testlo' && ${1} != 'testnlo' && ${1} != 'testwps' ]]
  then
    echo ""
    echo "||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||"
    echo "||||||||||KKKKKKKKKKK||||KK||||||KKKKKKKKKKK||||KKKKKK||||KKKKKKKKKKK|||"
    echo "||||||||||KK|||||||||||||KK||||||KK||||||||||||KK||||KK|||KK|||||||KK|||"
    echo "||||||||||KK|||||||||||||KK||||||KK|||||||||||KK||||||KK||KK|||||||KK|||"
    echo "||||||||||KK|||||||||||||KK||||||KKKKKKKKKKK|KKKKKKKKKKKK|KKKKKKKKKKK|||"
    echo "||||||||||KK|||||||||||||KK||||||KK||||||||||KK||||||||KK|KKKK||||||||||"
    echo "||||||||||KK|||||||||||||KK||||||KK||||||||||KK||||||||KK|KK|KK|||||||||"
    echo "||||||||||KKKKKKKKKKK||||KKKKKK||KKKKKKKKKKK|KK||||||||KK|KK||KK||||||||"   
    echo "||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||"    
    echo "||||||||||||||||||||||||E|||||||EEEEE||||EEEEE|||EEEEE||||||||||||||||||"
    echo "||||||||||||||||||||||||E|||||||E|||E||||E|||||||E||||||||||||||||||||||"
    echo "||||||||||||||||||||||||E|||||||E|||E||||E||EE|||EEEEE||||||||||||||||||"
    echo "||||||||||||||||||||||||E|||||||E|||E||||E|||E|||||||E||||||||||||||||||"
    echo "||||||||||||||||||||||||EEEEE|||EEEEE||||EEEEE|||EEEEE||||||||||||||||||"
    echo "||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||"
    echo ""
    echo "Please enter the correct parameters: "
    echo ""
    echo " ftlo , ftnlo , ftwps , ntlo , ntnlo , ntwps , testlo , testnlo , testwps"
	echo ""
fi

# read -p "Enter host: " HOHO

HOHO=`hostname`
BUS=${1}

# FT LO

if [[ ${HOHO} = 'srv800p17' && ${BUS} = 'ftlo' ]]
  then
#    echo " That's preft lo"
#    echo " There is 1 dmgr and 2 nodes"

#    echo "Dirs before cleaning:"
#    echo ""
#    echo `ls -la /opt/esb/profiles62/dmgr/temp/`
#    echo ""

    cd /opt/esb/profiles62/dmgr/
    rm -rf ./temp/* ./config/temp/* ./wstemp/* ./tranlog/*
    
#    echo "Dirs after cleaning:"
#    echo ""
#    echo `ls -la /opt/esb/profiles62/dmgr/temp/`
#    echo ""

    cd /opt/esb/profiles62/wps/
    rm -rf ./temp/* ./config/temp/* ./wstemp/* ./tranlog/*

    cd /opt/esb/ps/profiles/BIP000*/
    rm -rf ./temp/* ./config/temp/* ./wstemp/* ./tranlog/*
	
#   echo "preft lo dmgr cleared."
#   echo "preft lo wpsnode cleared."
#   echo "preft lo BIPnode cleared."

    echo ""
    echo "Tranlogs on ${HOHO} cleared."
	echo ""
fi

# FT NLO

if [[ ${HOHO} = 'srv800p16' && ${BUS} = 'ftnlo' ]]
  then 
#    echo " That's preft nlo"
#    echo " There is 1 dmgr and 1 node"
    
    cd /opt/esb/profiles/dmgr/
    rm -rf ./temp/* ./config/temp/* ./wstemp/* ./tranlog/*

    cd /opt/esb/profiles/wps/
    rm -rf ./temp/* ./config/temp/* ./wstemp/* ./tranlog/*
	 
#    echo "preft nlo dmgr cleared."
#    echo "preft nlo wpsnode cleared."

    echo ""
    echo "Tranlogs on ${HOHO} cleared."	
	echo ""
fi

# FT NLOWPS
    
if [[ ${HOHO} = 'srv800p18' && ${BUS} = 'ftwps' ]]
  then
#    echo " That's preft nlowps"
#    echo " There is 1 dmgr and 1 node"

    cd /opt/esb/nonlowpspreprod/profiles/dmgr
    rm -rf ./temp/* ./config/temp/* ./wstemp/* ./tranlog/*
     
    cd /opt/esb/nonlowpspreprod/profiles/node
    rm -rf ./temp/* ./config/temp/* ./wstemp/* ./tranlog/*
	
#    echo "preft nlowps dmgr cleared."
#    echo "preft nlowps node cleared."

    echo ""
    echo "Tranlogs on ${HOHO} cleared."
	echo ""
fi

# NT LO1

if [[ ${HOHO} = 'srv560p05' && ${BUS} = 'ntlo' ]]
  then
#    echo " That's prent lo1"
#    echo " There is 1 dmgr and 2 nodes"

    cd /opt/esb/profiles62/dmgr/
    rm -rf ./temp/* ./config/temp/* ./wstemp/* ./tranlog/*

    cd /opt/esb/profiles62/wps/
    rm -rf ./temp/* ./config/temp/* ./wstemp/* ./tranlog/*

    cd /opt/esb/ps/profiles/BIP000*/
    rm -rf ./temp/* ./config/temp/* ./wstemp/* ./tranlog/*
	
#    echo "prent lo1 dmgr cleared."
#    echo "prent lo1 wpsnode cleared."
#    echo "prent lo1 bipnode cleared."

    echo ""
    echo "Tranlogs on ${HOHO} cleared."
	echo ""
fi

# NT LO2

if [[ ${HOHO} = 'srv560p06' && ${BUS} = 'ntlo' ]]
  then
#    echo " That's prent lo2"
#    echo " There are 2 nodes"
   
    cd /opt/esb/profiles62/wps/
    rm -rf ./temp/* ./config/temp/* ./wstemp/* ./tranlog/*
     
    cd /opt/esb/ps/profiles/BIP000*/
    rm -rf ./temp/* ./config/temp/* ./wstemp/* ./tranlog/*
	
#    echo "prent lo2 wpsnode cleared."
#    echo "prent lo2 bipnode cleared."

    echo ""
    echo "Tranlogs on ${HOHO} cleared."
	echo ""
fi
  
# NT NLO1

if [[ ${HOHO} = 'srvh03p06' && ${BUS} = 'ntnlo' ]]
  then
#    echo " That's prent nlo1"
#    echo " There is 1 dmgr and 2 nodes"

    cd /opt/esb/profiles/dmgr
    rm -rf ./temp/* ./config/temp/* ./wstemp/* ./tranlog/*
     
    cd /opt/esb/profiles/wps/
    rm -rf ./temp/* ./config/temp/* ./wstemp/* ./tranlog/*
     
    cd /opt/esb/profiles/node3/
    rm -rf ./temp/* ./config/temp/* ./wstemp/* ./tranlog/*
	
#    echo "prent nlo1 dmgr cleared."
#    echo "prent nlo1 wpsnode cleared."
#    echo "prent nlo1 node cleared."

    echo ""
    echo "Tranlogs on ${HOHO} cleared."
	echo ""
fi

# NT NLO2
  
if [[ ${HOHO} = 'srvh03p07' && ${BUS} = 'ntnlo' ]]
  then
#    echo " That's prent nlo2"
#    echo " There is 1 node"

    cd /opt/esb/profiles/wps/
    rm -rf ./temp/* ./config/temp/* ./wstemp/* ./tranlog/*
	
#    echo "prent nlo2 wpsnode cleared."

    echo ""
    echo "Tranlogs on ${HOHO} cleared."
	echo ""
fi
  
# NT NLOWPS1
       
if [[ ${HOHO} = 'srv560p05' && ${BUS} = 'ntwps' ]]
  then
#    echo " That's prent nlowps1"
#    echo " There is 1 dmgr and 1 node"
  
    cd /opt/esb/nonlowpspreprod/profiles/dmgr/
    rm -rf ./temp/* ./config/temp/* ./wstemp/* ./tranlog/*
     
    cd /opt/esb/nonlowpspreprod/profiles/node/
    rm -rf ./temp/* ./config/temp/* ./wstemp/* ./tranlog/*
	
#    echo "prent nlowps1 dmgr cleared."
#    echo "prent nlowps1 node cleared."

    echo ""
    echo "Tranlogs on ${HOHO} cleared."
	echo ""
fi
      
# NT NLOWPS2
                 
if [[ ${HOHO} = 'srv560p06' && ${BUS} = 'ntwps' ]]
  then
#    echo " That's prent nlowps2"
#    echo " There is 1 node"
    
    cd /opt/esb/nonlowpspreprod/profiles/node/
    rm -rf ./temp/* ./config/temp/* ./wstemp/* ./tranlog/*
	
#    echo "prent nlowps2 node cleared."

    echo ""
    echo "Tranlogs on ${HOHO} cleared."
	echo ""
fi

# TEST LO1

if [[ ${HOHO} = 'srv560p01' && ${BUS} = 'testlo' ]]
  then
#    echo " That's test lo1"
#    echo " There is 1 dmgr and 2 nodes"

    cd /opt/esb/profiles/dmgr/
    rm -rf ./temp/* ./config/temp/* ./wstemp/* ./tranlog/*
    
    cd /opt/esb/profiles/wps/
    rm -rf ./temp/* ./config/temp/* ./wstemp/* ./tranlog/*
    
    cd /opt/esb/profiles/BIPNode01/
    rm -rf ./temp/* ./config/temp/* ./wstemp/* ./tranlog/*
	
#    echo "test lo1 dmgr cleared."
#    echo "test lo1 wpsnode cleared."
#    echo "test lo1 bipnode cleared." 

    echo ""
    echo "Tranlogs on ${HOHO} cleared."
	echo ""
fi

# TEST LO2

if [[ ${HOHO} = 'srv560p04' && ${BUS} = 'testlo' ]]
  then 
#    echo " That's test lo2"
#    echo " There are 2 nodes"
    
    cd /opt/esb/profiles/wps/
    rm -rf ./temp/* ./config/temp/* ./wstemp/* ./tranlog/*
     
    cd /opt/esb/profiles/BIPNode02/
    rm -rf ./temp/* ./config/temp/* ./wstemp/* ./tranlog/*
	
#    echo "test lo2 wpsnode cleared."
#    echo "test lo2 bipnode cleared."

    echo ""
    echo "Tranlogs on ${HOHO} cleared."
	echo ""
fi

# TEST NLO
    
if [[ ${HOHO} = 'srvh03p04' && ${BUS} = 'testnlo' ]]
  then
#    echo " That's test nlo"
#    echo " There is 1 dmgr and 1 node"

    cd /opt/esb/profiles/dmgr/
    rm -rf ./temp/* ./config/temp/* ./wstemp/* ./tranlog/*
     
    cd /opt/esb/profiles/node1/
    rm -rf ./temp/* ./config/temp/* ./wstemp/* ./tranlog/*
	
#    echo "test nlo dmgr cleared."
#    echo "test nlo node cleared."

    echo ""
    echo "Tranlogs on ${HOHO} cleared."
	echo ""
fi
 
# TEST NLOWPS
          
if [[ ${HOHO} = 'srv560p04' && ${BUS} = 'testwps' ]]
  then
#    echo " That's test nlowps"
#    echo " There is 1 dmgr and 1 node"

    cd /opt/esb/nonlowpstest2/profiles/dmgr/
    rm -rf ./temp/* ./config/temp/* ./wstemp/* ./tranlog/*
     
    cd /opt/esb/nonlowpstest2/profiles/node/
    rm -rf ./temp/* ./config/temp/* ./wstemp/* ./tranlog/*
	
#    echo "test nlowps dmgr cleared."
#    echo "test nlowps node cleared."

    echo ""
    echo "Tranlogs on ${HOHO} cleared."
	echo ""
fi
