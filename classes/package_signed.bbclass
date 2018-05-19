# A class to cause packages to be signed.
# We will eventually create one for each type

####################################
# .deb packages
####################################
python do_package_sign_deb() {
    import bb

    # Sign packages
    pkgoutdir = os.path.join(d.getVar('PKGWRITEDIRDEB'), d.getVar('PACKAGE_ARCH'))

    bb.note("*** signing package in %s:" % pkgoutdir)

    bb.note("PATH=\"%s\" debsigs --sign=origin -k %s %s" % (d.getVar("PATH"), d.getVar("SIGNING_KEY"), pkgoutdir))

    # import subprocess
    # subprocess.check_output("PATH=\"%s\" ls -l %s" % (d.getVar("PATH"), pkgoutdir),
    #                        stderr=subprocess.STDOUT,
    #                        shell=True)
}

do_package_write_deb[postfuncs] += "do_package_sign_deb"

####################################
# .ipk packages
####################################
python do_package_sign_ipk() {
    import bb
    bb.note("********** This does not work yet **********")
}

do_package_write_ipk[postfuncs] += "do_package_sign_ipk"

####################################
# .rpm packages
####################################
python do_package_sign_rpm() {
    import bb
    bb.note("********** This does not work yet **********")
}

do_package_write_rpm[postfuncs] += "do_package_sign_rpm"

