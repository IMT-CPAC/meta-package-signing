FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

# Override config with enable of signature verify
SRC_URI += " \
	file://dpkg.cfg \
"
