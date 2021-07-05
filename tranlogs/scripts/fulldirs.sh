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
        touch ${NTLO1DMGR}${TEMP}"somelog${RANDOM}.log"
        touch ${NTLO1DMGR}${CONFIGTEMP}"somelog${RANDOM}.log"
        touch ${NTLO1DMGR}${WSTEMP}"somelog${RANDOM}.log"
        touch ${NTLO1DMGR}${TRANLOG}"somelog${RANDOM}.log"
		
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
	  
	  'srv560p06')
      for (( i = 1; i < 9; i++ )) do
        touch ${NTLO2WPS}${TEMP}"somelog${RANDOM}.log"
        touch ${NTLO2WPS}${CONFIGTEMP}"somelog${RANDOM}.log"
        touch ${NTLO2WPS}${WSTEMP}"somelog${RANDOM}.log"
        touch ${NTLO2WPS}${TRANLOG}"somelog${RANDOM}.log"
		
		touch ${NTLO2BIP0002}${TEMP}"somelog${RANDOM}.log"
        touch ${NTLO2BIP0002}${CONFIGTEMP}"somelog${RANDOM}.log"
        touch ${NTLO2BIP0002}${WSTEMP}"somelog${RANDOM}.log"
        touch ${NTLO2BIP0002}${TRANLOG}"somelog${RANDOM}.log"
		
      done
	  ;;
	  
	  'srvh03p06')
      for (( i = 1; i < 9; i++ )) do
        touch ${NTNLO1DMGR}${TEMP}"somelog${RANDOM}.log"
        touch ${NTNLO1DMGR}${CONFIGTEMP}"somelog${RANDOM}.log"
        touch ${NTNLO1DMGR}${WSTEMP}"somelog${RANDOM}.log"
        touch ${NTNLO1DMGR}${TRANLOG}"somelog${RANDOM}.log"
		
		touch ${NTNLO1WPS}${TEMP}"somelog${RANDOM}.log"
        touch ${NTNLO1WPS}${CONFIGTEMP}"somelog${RANDOM}.log"
        touch ${NTNLO1WPS}${WSTEMP}"somelog${RANDOM}.log"
        touch ${NTNLO1WPS}${TRANLOG}"somelog${RANDOM}.log"
		
		touch ${NTNLO1NODE3}${TEMP}"somelog${RANDOM}.log"
        touch ${NTNLO1NODE3}${CONFIGTEMP}"somelog${RANDOM}.log"
        touch ${NTNLO1NODE3}${WSTEMP}"somelog${RANDOM}.log"
        touch ${NTNLO1NODE3}${TRANLOG}"somelog${RANDOM}.log"
		
      done
	  ;;
	  
	  'srvh03p07')
      for (( i = 1; i < 9; i++ )) do
        touch ${NTNLO2WPS}${TEMP}"somelog${RANDOM}.log"
        touch ${NTNLO2WPS}${CONFIGTEMP}"somelog${RANDOM}.log"
        touch ${NTNLO2WPS}${WSTEMP}"somelog${RANDOM}.log"
        touch ${NTNLO2WPS}${TRANLOG}"somelog${RANDOM}.log"
		
      done
	  ;;
	  
	  
	  'srv560p05')
      for (( i = 1; i < 9; i++ )) do
        touch ${NTNLOWPS1DMGR}${TEMP}"somelog${RANDOM}.log"
        touch ${NTNLOWPS1DMGR}${CONFIGTEMP}"somelog${RANDOM}.log"
        touch ${NTNLOWPS1DMGR}${WSTEMP}"somelog${RANDOM}.log"
        touch ${NTNLOWPS1DMGR}${TRANLOG}"somelog${RANDOM}.log"
		
		touch ${NTNLOWPS1NODE}${TEMP}"somelog${RANDOM}.log"
        touch ${NTNLOWPS1NODE}${CONFIGTEMP}"somelog${RANDOM}.log"
        touch ${NTNLOWPS1NODE}${WSTEMP}"somelog${RANDOM}.log"
        touch ${NTNLOWPS1NODE}${TRANLOG}"somelog${RANDOM}.log"
		
      done
	  ;;
	  
	  
	  'srv560p06')
      for (( i = 1; i < 9; i++ )) do
        touch ${NTNLOWPS2NODE}${TEMP}"somelog${RANDOM}.log"
        touch ${NTNLOWPS2NODE}${CONFIGTEMP}"somelog${RANDOM}.log"
        touch ${NTNLOWPS2NODE}${WSTEMP}"somelog${RANDOM}.log"
        touch ${NTNLOWPS2NODE}${TRANLOG}"somelog${RANDOM}.log"
		
      done
	  ;;
	  
	  
	  'srv560p01')
      for (( i = 1; i < 9; i++ )) do
        touch ${TESTLO1DMGR}${TEMP}"somelog${RANDOM}.log"
        touch ${TESTLO1DMGR}${CONFIGTEMP}"somelog${RANDOM}.log"
        touch ${TESTLO1DMGR}${WSTEMP}"somelog${RANDOM}.log"
        touch ${TESTLO1DMGR}${TRANLOG}"somelog${RANDOM}.log"
		
		touch ${TESTLO1WPS}${TEMP}"somelog${RANDOM}.log"
        touch ${TESTLO1WPS}${CONFIGTEMP}"somelog${RANDOM}.log"
        touch ${TESTLO1WPS}${WSTEMP}"somelog${RANDOM}.log"
        touch ${TESTLO1WPS}${TRANLOG}"somelog${RANDOM}.log"
		
		touch ${TESTLO1BIPNODE01}${TEMP}"somelog${RANDOM}.log"
        touch ${TESTLO1BIPNODE01}${CONFIGTEMP}"somelog${RANDOM}.log"
        touch ${TESTLO1BIPNODE01}${WSTEMP}"somelog${RANDOM}.log"
        touch ${TESTLO1BIPNODE01}${TRANLOG}"somelog${RANDOM}.log"
		
      done
	  ;;
	  
	  
	  'srv560p04')
      for (( i = 1; i < 9; i++ )) do
        touch ${TESTLO2WPS}${TEMP}"somelog${RANDOM}.log"
        touch ${TESTLO2WPS}${CONFIGTEMP}"somelog${RANDOM}.log"
        touch ${TESTLO2WPS}${WSTEMP}"somelog${RANDOM}.log"
        touch ${TESTLO2WPS}${TRANLOG}"somelog${RANDOM}.log"
		
		touch ${TESTLO2BIPNODE02}${TEMP}"somelog${RANDOM}.log"
        touch ${TESTLO2BIPNODE02}${CONFIGTEMP}"somelog${RANDOM}.log"
        touch ${TESTLO2BIPNODE02}${WSTEMP}"somelog${RANDOM}.log"
        touch ${TESTLO2BIPNODE02}${TRANLOG}"somelog${RANDOM}.log"
		
      done
	  ;;
	  
	  
	  'srvh03p04')
      for (( i = 1; i < 9; i++ )) do
        touch ${TESTNLODMGR}${TEMP}"somelog${RANDOM}.log"
        touch ${TESTNLODMGR}${CONFIGTEMP}"somelog${RANDOM}.log"
        touch ${TESTNLODMGR}${WSTEMP}"somelog${RANDOM}.log"
        touch ${TESTNLODMGR}${TRANLOG}"somelog${RANDOM}.log"
		
		touch ${TESTNLONODE1}${TEMP}"somelog${RANDOM}.log"
        touch ${TESTNLONODE1}${CONFIGTEMP}"somelog${RANDOM}.log"
        touch ${TESTNLONODE1}${WSTEMP}"somelog${RANDOM}.log"
        touch ${TESTNLONODE1}${TRANLOG}"somelog${RANDOM}.log"
		
      done
	  ;;
	  
	  
	  'srv560p04')
      for (( i = 1; i < 9; i++ )) do
        touch ${TESTNLOWPSDMGR}${TEMP}"somelog${RANDOM}.log"
        touch ${TESTNLOWPSDMGR}${CONFIGTEMP}"somelog${RANDOM}.log"
        touch ${TESTNLOWPSDMGR}${WSTEMP}"somelog${RANDOM}.log"
        touch ${TESTNLOWPSDMGR}${TRANLOG}"somelog${RANDOM}.log"
		
		touch ${TESTNLOWPSNODE}${TEMP}"somelog${RANDOM}.log"
        touch ${TESTNLOWPSNODE}${CONFIGTEMP}"somelog${RANDOM}.log"
        touch ${TESTNLOWPSNODE}${WSTEMP}"somelog${RANDOM}.log"
        touch ${TESTNLOWPSNODE}${TRANLOG}"somelog${RANDOM}.log"
		
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
		
		
		'srv560p06')
		if [ ! -d "${NTLO2WPS}" ]
		  then
		    mkdir -p ${NTLO2WPS}
			mkdir -p ${NTLO2WPS}${TEMP}
			mkdir -p ${NTLO2WPS}${CONFIGTEMP}
			mkdir -p ${NTLO2WPS}${WSTEMP}
			mkdir -p ${NTLO2WPS}${TRANLOG}
		fi

		if [ ! -d "${NTLO2BIP0002}" ]
		  then
	        mkdir -p ${NTLO2BIP0002}
		    mkdir -p ${NTLO2BIP0002}${TEMP}
			mkdir -p ${NTLO2BIP0002}${CONFIGTEMP}
			mkdir -p ${NTLO2BIP0002}${WSTEMP}
			mkdir -p ${NTLO2BIP0002}${TRANLOG}
		fi
		
		fulldir ${HOSTNAME}
		;;
		
		'srvh03p06')
		if [ ! -d "${NTNLO1DMGR}" ]
		  then
		    mkdir -p ${NTNLO1DMGR}
			mkdir -p ${NTNLO1DMGR}${TEMP}
			mkdir -p ${NTNLO1DMGR}${CONFIGTEMP}
			mkdir -p ${NTNLO1DMGR}${WSTEMP}
			mkdir -p ${NTNLO1DMGR}${TRANLOG}
		fi

		if [ ! -d "${NTNLO1WPS}" ]
		  then
	        mkdir -p ${NTNLO1WPS}
		    mkdir -p ${NTNLO1WPS}${TEMP}
			mkdir -p ${NTNLO1WPS}${CONFIGTEMP}
			mkdir -p ${NTNLO1WPS}${WSTEMP}
			mkdir -p ${NTNLO1WPS}${TRANLOG}
		fi

		if [ ! -d "${NTNLO1NODE3}" ]
		  then
		    mkdir -p ${NTNLO1NODE3}
			mkdir -p ${NTNLO1NODE3}${TEMP}
			mkdir -p ${NTNLO1NODE3}${CONFIGTEMP}
			mkdir -p ${NTNLO1NODE3}${WSTEMP}
			mkdir -p ${NTNLO1NODE3}${TRANLOG}
		fi
		
		fulldir ${HOSTNAME}
		;;
		
		'srvh03p07')
		if [ ! -d "${NTNLO2WPS}" ]
		  then
		    mkdir -p ${NTNLO2WPS}
			mkdir -p ${NTNLO2WPS}${TEMP}
			mkdir -p ${NTNLO2WPS}${CONFIGTEMP}
			mkdir -p ${NTNLO2WPS}${WSTEMP}
			mkdir -p ${NTNLO2WPS}${TRANLOG}
		fi
		
		fulldir ${HOSTNAME}
		;;
		
		
		'srv560p05')
		if [ ! -d "${NTNLOWPS1DMGR}" ]
		  then
		    mkdir -p ${NTNLOWPS1DMGR}
			mkdir -p ${NTNLOWPS1DMGR}${TEMP}
			mkdir -p ${NTNLOWPS1DMGR}${CONFIGTEMP}
			mkdir -p ${NTNLOWPS1DMGR}${WSTEMP}
			mkdir -p ${NTNLOWPS1DMGR}${TRANLOG}
		fi

		if [ ! -d "${NTNLOWPS1NODE}" ]
		  then
	        mkdir -p ${NTNLOWPS1NODE}
		    mkdir -p ${NTNLOWPS1NODE}${TEMP}
			mkdir -p ${NTNLOWPS1NODE}${CONFIGTEMP}
			mkdir -p ${NTNLOWPS1NODE}${WSTEMP}
			mkdir -p ${NTNLOWPS1NODE}${TRANLOG}
		fi
		
		fulldir ${HOSTNAME}
		;;
		
		'srv560p06')
		if [ ! -d "${NTNLOWPS2NODE}" ]
		  then
		    mkdir -p ${NTNLOWPS2NODE}
			mkdir -p ${NTNLOWPS2NODE}${TEMP}
			mkdir -p ${NTNLOWPS2NODE}${CONFIGTEMP}
			mkdir -p ${NTNLOWPS2NODE}${WSTEMP}
			mkdir -p ${NTNLOWPS2NODE}${TRANLOG}
		fi
		
		fulldir ${HOSTNAME}
		;;
		
		
		'srv560p01')
		if [ ! -d "${TESTLO1DMGR}" ]
		  then
		    mkdir -p ${TESTLO1DMGR}
			mkdir -p ${TESTLO1DMGR}${TEMP}
			mkdir -p ${TESTLO1DMGR}${CONFIGTEMP}
			mkdir -p ${TESTLO1DMGR}${WSTEMP}
			mkdir -p ${TESTLO1DMGR}${TRANLOG}
		fi

		if [ ! -d "${TESTLO1WPS}" ]
		  then
	        mkdir -p ${TESTLO1WPS}
		    mkdir -p ${TESTLO1WPS}${TEMP}
			mkdir -p ${TESTLO1WPS}${CONFIGTEMP}
			mkdir -p ${TESTLO1WPS}${WSTEMP}
			mkdir -p ${TESTLO1WPS}${TRANLOG}
		fi

		if [ ! -d "${TESTLO1BIPNODE01}" ]
		  then
		    mkdir -p ${TESTLO1BIPNODE01}
			mkdir -p ${TESTLO1BIPNODE01}${TEMP}
			mkdir -p ${TESTLO1BIPNODE01}${CONFIGTEMP}
			mkdir -p ${TESTLO1BIPNODE01}${WSTEMP}
			mkdir -p ${TESTLO1BIPNODE01}${TRANLOG}
		fi
		
		fulldir ${HOSTNAME}
		;;
		
		
		'srv560p04')
		if [ ! -d "${TESTLO2WPS}" ]
		  then
	        mkdir -p ${TESTLO2WPS}
		    mkdir -p ${TESTLO2WPS}${TEMP}
			mkdir -p ${TESTLO2WPS}${CONFIGTEMP}
			mkdir -p ${TESTLO2WPS}${WSTEMP}
			mkdir -p ${TESTLO2WPS}${TRANLOG}
		fi

		if [ ! -d "${TESTLO2BIPNODE02}" ]
		  then
		    mkdir -p ${TESTLO2BIPNODE02}
			mkdir -p ${TESTLO2BIPNODE02}${TEMP}
			mkdir -p ${TESTLO2BIPNODE02}${CONFIGTEMP}
			mkdir -p ${TESTLO2BIPNODE02}${WSTEMP}
			mkdir -p ${TESTLO2BIPNODE02}${TRANLOG}
		fi
		
		fulldir ${HOSTNAME}
		;;
		
		
		'srvh03p04')
		if [ ! -d "${TESTNLODMGR}" ]
		  then
		    mkdir -p ${TESTNLODMGR}
			mkdir -p ${TESTNLODMGR}${TEMP}
			mkdir -p ${TESTNLODMGR}${CONFIGTEMP}
			mkdir -p ${TESTNLODMGR}${WSTEMP}
			mkdir -p ${TESTNLODMGR}${TRANLOG}
		fi

		if [ ! -d "${TESTNLONODE1}" ]
		  then
	        mkdir -p ${TESTNLONODE1}
		    mkdir -p ${TESTNLONODE1}${TEMP}
			mkdir -p ${TESTNLONODE1}${CONFIGTEMP}
			mkdir -p ${TESTNLONODE1}${WSTEMP}
			mkdir -p ${TESTNLONODE1}${TRANLOG}
		fi
		
		fulldir ${HOSTNAME}
		;;
		
		
		'srv560p04')
		if [ ! -d "${TESTNLOWPSDMGR}" ]
		  then
		    mkdir -p ${TESTNLOWPSDMGR}
			mkdir -p ${TESTNLOWPSDMGR}${TEMP}
			mkdir -p ${TESTNLOWPSDMGR}${CONFIGTEMP}
			mkdir -p ${TESTNLOWPSDMGR}${WSTEMP}
			mkdir -p ${TESTNLOWPSDMGR}${TRANLOG}
		fi

		if [ ! -d "${TESTNLOWPSNODE}" ]
		  then
	        mkdir -p ${TESTNLOWPSNODE}
		    mkdir -p ${TESTNLOWPSNODE}${TEMP}
			mkdir -p ${TESTNLOWPSNODE}${CONFIGTEMP}
			mkdir -p ${TESTNLOWPSNODE}${WSTEMP}
			mkdir -p ${TESTNLOWPSNODE}${TRANLOG}
		fi
		
		fulldir ${HOSTNAME}
		;;
		
esac