# The values here are used by the configure script and defined as
# macros in the generated config.h when ./configure is run. Traditionally the
# third field is the "bug report" address, but using a URL is acceptable
AC_INIT([vfu], [4.18], [https://github.com/cade-vs/vfu/issues],,[http://cade.datamax.bg/vfu/])
AC_CONFIG_AUX_DIR([build-aux])
AM_INIT_AUTOMAKE([subdir-objects foreign no-dependencies])
AC_PREREQ(2.69)
AC_CONFIG_HEADERS([config.h:config.in])

if test -f configure.ac; then
    AC_MSG_ERROR([configure should be run in a separate build directory], [1])
fi

# Don't add -g and -O2 by default
: ${CFLAGS=""}

# RELEASE TODO: set this to "no"
# This will add debug and profiling options to ./configure
AX_CHECK_ENABLE_DEBUG([yes])

AC_PROG_CC # yascreen use C, not CXX
AC_PROG_CXX
AC_CONFIG_MACRO_DIRS([build-aux/m4])
AC_PROG_INSTALL
AC_SYS_LARGEFILE

# Allows for building static libraries
AC_PROG_RANLIB

# This prevents problems such as those shown in
# https://github.com/theimpossibleastronaut/rmw/commit/90200c2df06b16f16b5d21d25c51966c0ee65b23#commitcomment-30291627
# and https://github.com/theimpossibleastronaut/rmw/issues/21
AM_MAINTAINER_MODE

AX_PATH_LIB_PCRE

AX_WITH_CURSES
AC_ARG_ENABLE(
	yascreen,
	AC_HELP_STRING(--enable-yascreen, use yascreen instead of curses/ncurses)
)

if test "x$enable_yascreen" = xyes || test "x$ax_cv_curses" = xno; then
    AC_MSG_NOTICE(-- vfu will build with yascreen support)
    want_yascreen="yes"
    AM_CONDITIONAL([WANT_YASCREEN], [test "x$want_yascreen" = xyes])
    AC_DEFINE([USE_YASCREEN], [1], [Define to 1 if yascreen was requested])
    CXXFLAGS="$CXXFLAGS -I$ac_abs_confdir/yascreen"
    LDFLAGS="-L../yas-libs"
    LIBS="-lrt -lyascreen"
else
    AM_CONDITIONAL([WANT_YASCREEN], [test "x$want_yascreen" = xno])
    CXXFLAGS="$CXXFLAGS $CURSES_CFLAGS"
    LIBS="$CURSES_LIBS"
fi

# Defining HAVE_CONFIG_H is needed because we are using different sets of Makefiles
DEFS="$DEFS -DHAVE_CONFIG_H"

AC_CONFIG_FILES([   Makefile
                    yas-libs/Makefile
                    vslib/Makefile
                    vslib/t/Makefile
                    vfu/Makefile])
AC_OUTPUT
