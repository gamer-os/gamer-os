#!/bin/bash

# configuration variables for the iso
iso_name="gamer-os"
iso_label="GAMER_OS_$(date +%Y%m)"
iso_publisher="Gamer OS <https://github.com/gamer-os/gamer-os>"
iso_application="Gamer OS Installer"
iso_version="$(date +%Y.%m.%d)"
install_script="install.sh"

output_dir="output"

# get the directory of this script
work_dir="$(realpath $0|rev|cut -d '/' -f2-|rev)"

# create output directory if it doesn't exist yet
mkdir -p ${work_dir}/${output_dir}

# copy the install.sh script for inclusion on the iso
cp -pf ${work_dir}/${install_script} ${work_dir}/gamer-os/airootfs/root/

# change working directory
cd ${work_dir}/gamer-os

# make the container build the iso
exec ./build.sh -v -N ${iso_name} -L ${iso_label} -P ${iso_publisher} -A ${iso_application} -V ${iso_version} -o ${work_dir}/${output_dir}
