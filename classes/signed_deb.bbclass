inherit package_deb deploy

DEPENDS += " dpkg-sig-native"


SSTATETASKS += "do_package_sign_deb"

do_package_sign_deb() {
    echo "------------------------------------------------------------------------------------------"
    echo "package_sign_deb"
    echo "PKGWRITEDIRDEB = ${PKGWRITEDIRDEB}"
    echo "DEPLOY_DIR_DEB = ${DEPLOY_DIR_DEB}"
    echo "PN = ${PN}"
    echo "PV = ${PV}"
    echo "------------------------------------------------------------------------------------------"
    # (cd ${DIRECTORY}; dpkg-sig --sign builder -k ${GPGKEY} *.deb)
    # (cd ${DIRECTORY}; dpkg-sig --verify *.deb)
}

python do_package_sign_deb_setscene() {
    sstate_setscene(d)
}

do_package_sign_deb[dirs] = "${WORKDIR} ${PKGWRITEDIRDEB}"
do_package_sign_deb[sstate-inputdirs] = "${PKGWRITEDIRDEB}"
do_package_sign_deb[sstate-outputdirs] = "${PKGWRITEDIRDEB}"

addtask package_sign_deb after do_package_write_deb

