SUBDIRS = yas-libs vslib vslib/t vfu

packextrasdir=@docdir@
EXTRA_DIST = \
    COPYING \
    makefile    \
    README.MAC_OSX  \
    vfu.html    \
    build.sh    \
    build.docs  \
    THANKS.TO   \
    vfu.lsm \
    build.netbsd    \
    FAQ \
    mm.conf \
    TODO    \
    vfu.pod \
    COMPILE.NOTES   \
    HISTORY \
    mm.proba.conf   \
    vfu.wiki    \
    CONFIG  \
    README  \
    INSTALL \
    README.DOS  \
    XWINDOW.NOTES

packextras_DATA=$(EXTRA_DIST)

# Install the English man file and include it when `make dist` is used
dist_man_MANS=vfu.1

# Install the configuration to $(sysconfdir)
sysconf_DATA = vfu.conf

ACLOCAL_AMFLAGS = --install -I build-aux/m4
