#!/bin/bash

if [[ `id -u` -ne 0 ]]
  then echo "You have little rights"
  exit 1
fi

HOSTNAME=`hostname`

FTLODMGR=/opt/esb/profiles62/dmgr/
FTLOWPS=/opt/esb/profiles62/wps/
FTLOBIP0001=/opt/esb/ps/profiles/BIP0001/

FTNLODMGR=/opt/esb/profiles/dmgr/
FTNLOWPS=/opt/esb/profiles/wps/

FT_NLOWPSDMGR=/opt/esb/nonlowpspreprod/profiles/dmgr/
FT_NLOWPSNODE=/opt/esb/nonlowpspreprod/profiles/node/

NTLO1DMGR=/opt/esb/profiles62/dmgr/
NTLO1WPS=/opt/esb/profiles62/wps/
NTLO1BIP0001=/opt/esb/ps/profiles/BIP0001/

NTLO2WPS=/opt/esb/profiles62/wps/
NTLO2BIP0002=/opt/esb/ps/profiles/BIP0002/

NTNLO1DMGR=/opt/esb/profiles/dmgr/
NTNLO1WPS=/opt/esb/profiles/wps/
NTNLO1NODE3=/opt/esb/profiles/node3/

NTNLO2WPS=/opt/esb/profiles/wps/

NTNLOWPS1DMGR=/opt/esb/nonlowpspreprod/profiles/dmgr/
NTNLOWPS1NODE=/opt/esb/nonlowpspreprod/profiles/node/

NTNLOWPS2NODE=/opt/esb/nonlowpspreprod/profiles/node/

TESTLO1DMGR=/opt/esb/profiles/dmgr/
TESTLO1WPS=/opt/esb/profiles/wps/
TESTLO1BIPNODE01=/opt/esb/profiles/BIPNode01/

TESTLO2WPS=/opt/esb/profiles/wps/
TESTLO2BIPNODE02=/opt/esb/profiles/BIPNode02/

TESTNLODMGR=/opt/esb/profiles/dmgr/
TESTNLONODE1=/opt/esb/profiles/node1/

TESTNLOWPSDMGR=/opt/esb/nonlowpstest2/profiles/dmgr/
TESTNLOWPSNODE=/opt/esb/nonlowpstest2/profiles/node/

TEMP=temp/
CONFIGTEMP=config/temp/
WSTEMP=wstemp/
TRANLOG=tranlog/

# Fill temp directories with some random logs

fulldir() {
  case ${1} in
  
	'srv800p17')
      for (( i = 1; i < 9; i++ )) do
        touch ${FTLODMGR}${TEMP}"somelog${RANDOM}.log"
        touch ${FTLODMGR}${CONFIGTEMP}"somelog${RANDOM}.log"
        touch ${FTLODMGR}${WSTEMP}"somelog${RANDOM}.log"
        touch ${FTLODMGR}${TRANLOG}"somelog${RANDOM}.log"
		
		touch ${FTLOWPS}${TEMP}"somelog${RANDOM}.log"
        touch ${FTLOWPS}${CONFIGTEMP}"somelog${RANDOM}.log"
        touch ${FTLOWPS}${WSTEMP}"somelog${RANDOM}.log"
        touch ${FTLOWPS}${TRANLOG}"somelog${RANDOM}.log"
		
		touch ${FTLOBIP0001}${TEMP}"somelog${RANDOM}.log"
        touch ${FTLOBIP0001}${CONFIGTEMP}"somelog${RANDOM}.log"
        touch ${FTLOBIP0001}${WSTEMP}"somelog${RANDOM}.log"
        touch ${FTLOBIP0001}${TRANLOG}"somelog${RANDOM}.log"
		
      done
	  ;;
	  
	  'srv800p16')
	    for (( i = 1; i < 9; i++ )) do
        touch ${FTNLODMGR}${TEMP}"somelog${RANDOM}.log"
        touch ${FTNLODMGR}${CONFIGTEMP}"somelog${RANDOM}.log"
        touch ${FTNLODMGR}${WSTEMP}"somelog${RANDOM}.log"
        touch ${FTNLODMGR}${TRANLOG}"somelog${RANDOM}.log"
		
		touch ${FTNLOWPS}${TEMP}"somelog${RANDOM}.log"
        touch ${FTNLOWPS}${CONFIGTEMP}"somelog${RANDOM}.log"
        touch ${FTNLOWPS}${WSTEMP}"somelog${RANDOM}.log"
        touch ${FTNLOWPS}${TRANLOG}"somelog${RANDOM}.log"
		
      done
	  ;;
	  
	  'srv800p18')
	    for (( i = 1; i < 9; i++ )) do
        touch ${FT_NLOWPSDMGR}${TEMP}"somelog${RANDOM}.log"
        touch ${FT_NLOWPSDMGR}${CONFIGTEMP}"somelog${RANDOM}.log"
        touch ${FT_NLOWPSDMGR}${WSTEMP}"somelog${RANDOM}.log"
        touch ${FT_NLOWPSDMGR}${TRANLOG}"somelog${RANDOM}.log"
		
		touch ${FT_NLOWPSNODE}${TEMP}"somelog${RANDOM}.log"
        touch ${FT_NLOWPSNODE}${CONFIGTEMP}"somelog${RANDOM}.log"
        touch ${FT_NLOWPSNODE}${WSTEMP}"somelog${RANDOM}.log"
        touch ${FT_NLOWPSNODE}${TRANLOG}"somelog${RANDOM}.log"
		
      done
	  ;;
	  
	  'srv560p05')
      for (( i = 1; i < 9; i++ )) do
        touch ${FTLODMGRNTLO1DMGR}${TEMP}"somelog${RANDOM}.log"
        touch ${FTLODMGRNTLO1DMGR}${CONFIGTEMP}"somelog${RANDOM}.log"
        touch ${FTLODMGRNTLO1DMGR}${WSTEMP}"somelog${RANDOM}.log"
        touch ${FTLODMGRNTLO1DMGR}${TRANLOG}"somelog${RANDOM}.log"
		
		touch ${NTLO1WPS}${TEMP}"somelog${RANDOM}.log"
        touch ${NTLO1WPS}${CONFIGTEMP}"somelog${RANDOM}.log"
        touch ${NTLO1WPS}${WSTEMP}"somelog${RANDOM}.log"
        touch ${NTLO1WPS}${TRANLOG}"somelog${RANDOM}.log"
		
		touch ${NTLO1BIP0001}${TEMP}"somelog${RANDOM}.log"
        touch ${NTLO1BIP0001}${CONFIGTEMP}"somelog${RANDOM}.log"
        touch ${NTLO1BIP0001}${WSTEMP}"somelog${RANDOM}.log"
        touch ${NTLO1BIP0001}${TRANLOG}"somelog${RANDOM}.log"
		
      done
	  ;;
	  
	  
	  
  esac
}

# Creating directories for logs

case ${HOSTNAME} in

	'srv800p17')
		if [ ! -d "${FTLODMGR}" ]
		  then
		    mkdir -p ${FTLODMGR}
			mkdir -p ${FTLODMGR}${TEMP}
			mkdir -p ${FTLODMGR}${CONFIGTEMP}
			mkdir -p ${FTLODMGR}${WSTEMP}
			mkdir -p ${FTLODMGR}${TRANLOG}
		fi

		if [ ! -d "${FTLOWPS}" ]
		  then
	        mkdir -p ${FTLOWPS}
		    mkdir -p ${FTLOWPS}${TEMP}
			mkdir -p ${FTLOWPS}${CONFIGTEMP}
			mkdir -p ${FTLOWPS}${WSTEMP}
			mkdir -p ${FTLOWPS}${TRANLOG}
		fi

		if [ ! -d "${FTLOBIP0001}" ]
		  then
		    mkdir -p ${FTLOBIP0001}
			mkdir -p ${FTLOBIP0001}${TEMP}
			mkdir -p ${FTLOBIP0001}${CONFIGTEMP}
			mkdir -p ${FTLOBIP0001}${WSTEMP}
			mkdir -p ${FTLOBIP0001}${TRANLOG}
		fi
		
		fulldir ${HOSTNAME}
		;;
		
		'srv800p16')
		if [ ! -d "${FTNLODMGR}" ]
		  then
		    mkdir -p ${FTNLODMGR}
			mkdir -p ${FTNLODMGR}${TEMP}
			mkdir -p ${FTNLODMGR}${CONFIGTEMP}
			mkdir -p ${FTNLODMGR}${WSTEMP}
			mkdir -p ${FTNLODMGR}${TRANLOG}
		fi

		if [ ! -d "${FTNLOWPS}" ]
		  then
	        mkdir -p ${FTNLOWPS}
		    mkdir -p ${FTNLOWPS}${TEMP}
			mkdir -p ${FTNLOWPS}${CONFIGTEMP}
			mkdir -p ${FTNLOWPS}${WSTEMP}
			mkdir -p ${FTNLOWPS}${TRANLOG}
		fi
		
		fulldir ${HOSTNAME}
		;;
		
		'srv800p18')
		if [ ! -d "${FT_NLOWPSDMGR}" ]
		  then
		    mkdir -p ${FT_NLOWPSDMGR}
			mkdir -p ${FT_NLOWPSDMGR}${TEMP}
			mkdir -p ${FT_NLOWPSDMGR}${CONFIGTEMP}
			mkdir -p ${FT_NLOWPSDMGR}${WSTEMP}
			mkdir -p ${FT_NLOWPSDMGR}${TRANLOG}
		fi

		if [ ! -d "${FT_NLOWPSNODE}" ]
		  then
	        mkdir -p ${FT_NLOWPSNODE}
		    mkdir -p ${FT_NLOWPSNODE}${TEMP}
			mkdir -p ${FT_NLOWPSNODE}${CONFIGTEMP}
			mkdir -p ${FT_NLOWPSNODE}${WSTEMP}
			mkdir -p ${FT_NLOWPSNODE}${TRANLOG}
		fi
		
		fulldir ${HOSTNAME}
		;;
		
		'srv560p05')
		if [ ! -d "${NTLO1DMGR}" ]
		  then
		    mkdir -p ${NTLO1DMGR}
			mkdir -p ${NTLO1DMGR}${TEMP}
			mkdir -p ${NTLO1DMGR}${CONFIGTEMP}
			mkdir -p ${NTLO1DMGR}${WSTEMP}
			mkdir -p ${NTLO1DMGR}${TRANLOG}
		fi

		if [ ! -d "${NTLO1WPS}" ]
		  then
	        mkdir -p ${NTLO1WPS}
		    mkdir -p ${NTLO1WPS}${TEMP}
			mkdir -p ${NTLO1WPS}${CONFIGTEMP}
			mkdir -p ${NTLO1WPS}${WSTEMP}
			mkdir -p ${NTLO1WPS}${TRANLOG}
		fi

		if [ ! -d "${NTLO1BIP0001}" ]
		  then
		    mkdir -p ${NTLO1BIP0001}
			mkdir -p ${NTLO1BIP0001}${TEMP}
			mkdir -p ${NTLO1BIP0001}${CONFIGTEMP}
			mkdir -p ${NTLO1BIP0001}${WSTEMP}
			mkdir -p ${NTLO1BIP0001}${TRANLOG}
		fi
		
		fulldir ${HOSTNAME}
		;;
		
esac