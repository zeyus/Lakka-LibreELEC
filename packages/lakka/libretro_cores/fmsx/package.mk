PKG_NAME="fmsx"
PKG_VERSION="0abd34399c756a8767edf7ccd28b940335312a8e"
PKG_LICENSE="Non-commercial"
PKG_SITE="https://github.com/libretro/fmsx-libretro"
PKG_URL="${PKG_SITE}.git"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="Port of fMSX to the libretro API."
PKG_TOOLCHAIN="make"

makeinstall_target() {
  mkdir -p ${INSTALL}/usr/lib/libretro
    cp -v fmsx_libretro.so ${INSTALL}/usr/lib/libretro/
}
