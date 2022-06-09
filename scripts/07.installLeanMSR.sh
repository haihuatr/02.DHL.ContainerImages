#!/bin/bash

. ${BUILD_SOURCESDIRECTORY}/scripts/setEnv.sh
. ${SUIF_HOME}/01.scripts/commonFunctions.sh
. ${SUIF_HOME}/01.scripts/installation/setupFunctions.sh

logI "SUIF env before installation of MSR:"
env | grep SUIF_ | sort

logI "Creating the home installation folder"

sudo mkdir -p "${SUIF_INSTALL_INSTALL_DIR}"
sudo chmod a+w "${SUIF_INSTALL_INSTALL_DIR}"

logI "Installing MSR..."

applySetupTemplate "${MY_MSR_template}"

installResult=$?

if [ "${installResult}" -ne 0 ]; then
  logE "Installation failed, code ${installResult}"
  exit 1
fi

logI "MSR installation successful"