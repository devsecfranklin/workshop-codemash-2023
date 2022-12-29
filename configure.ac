dnl Process this file with autoconf
AC_PREREQ([2.69])
AC_INIT(workshop-codemash-2023, 0.1, devsecfranklin@duck.com, https://github.com/devsecfranklin/workshop-codemash-2023)
AC_CONFIG_MACRO_DIR(config/m4)
AC_CONFIG_AUX_DIR(config)
AC_CONFIG_HEADERS(config)
AM_INIT_AUTOMAKE(foreign)
dnl AM_GNU_GETTEXT(external)
dnl AM_GNU_GETTEXT_VERSION(0.21)

LT_INIT

AC_CONFIG_COMMANDS([franklin-build],
 [echo "(⊃｡•́‿•̀｡)⊃━⭑･ﾟﾟ･*:༅｡.｡༅:*ﾟ:*:✼✿ Configuring for $mypkgname ☽༓･*˚⁺‧͙"],
 [mypkgname=$PACKAGE_NAME])
AC_CONFIG_FILES([
    Makefile
    docker/Makefile
    docs/lab/Makefile
    docs/slides/Makefile
])

dnl le python
AM_PATH_PYTHON(3.9) # minimum version of Python
PY39="python$PYTHON_VERSION" # define the python interpreter
dnl LDFLAGS="$LDFLAGS -l$PY39"
AC_SUBST(PY39, python$PYTHON_VERSION)
AM_CONDITIONAL([PYTHON], [which python])

AC_OUTPUT

