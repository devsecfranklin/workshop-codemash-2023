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
    lab/Makefile
])

dnl le python
AM_PATH_PYTHON(3.9) # minimum version of Python
PY39="python$PYTHON_VERSION" # define the python interpreter
dnl LDFLAGS="$LDFLAGS -l$PY39"
AC_SUBST(PY39, python$PYTHON_VERSION)
AM_CONDITIONAL([PYTHON], [which python])

# AC_CANONICAL_HOST is needed to access the 'host_os' variable    
AC_CANONICAL_HOST

build_linux=no
build_windows=no
build_mac=no

# Detect the target system
case "${host_os}" in
    linux*)
        build_linux=yes
        ;;
    cygwin*|mingw*)
        build_windows=yes
        ;;
    darwin*)
        build_mac=yes
        ;;
    *)
        AC_MSG_ERROR(["OS $host_os is not supported"])
        ;;
esac

# Pass the conditionals to automake
AM_CONDITIONAL([LINUX], [test "$build_linux" = "yes"])
AM_CONDITIONAL([WINDOWS], [test "$build_windows" = "yes"])
AM_CONDITIONAL([OSX], [test "$build_mac" = "yes"])

AC_LATEX_CLASS_ARTICLE
AC_LATEX_CLASS_BOOK
AC_LATEX_CLASS_REPORT
AC_LATEX_PACKAGE_AMSMATH
AC_LATEX_PACKAGE_FONTENC
AC_PROG_DVIPDF
AC_PROG_DVIPS
AC_PROG_FIG2DEV
AC_PROG_GNUPLOT
AC_PROG_MF
AC_PROG_LATEX
AC_PROG_BIBTEX
AC_PROG_PDFLATEX
AC_PROG_PS2PDF
dnl AC_PROG_LATEX2HTML
dnl AC_PROG_LATEX2MAN
AC_PROG_MAKEINDEX
dnl AC_PROG_JPEG2PS
AC_PROG_MKTEXPK
AC_PROG_TEXHASH
AC_PROG_KPSEWHICH
dnl AC_TEXMF_PATH
AC_PROG_PNGTOPNM
AC_PROG_PNMTOPS
AC_PROG_JPEGTOPNM
dnl AC_PROG_LATEX2PNG
dnl AC_PROG_LATEX2RTF
AC_PROG_PSBOOK
AC_PROG_PSNUP
AC_PROG_PSSELECT
AC_PROG_PSRESIZE
AC_PROG_DVIBOOK

AC_OUTPUT

