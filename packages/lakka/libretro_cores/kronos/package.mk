PKG_NAME="kronos"
PKG_VERSION="a387dec04313a7491415e4e150e5613f4a4a3e6c"
PKG_LICENSE="GPLv2"
PKG_SITE="https://github.com/libretro/yabause"
PKG_URL="${PKG_SITE}.git"
PKG_GIT_CLONE_BRANCH="kronos"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="Port of Kronos to libretro."
PKG_TOOLCHAIN="make"

PKG_MAKE_OPTS_TARGET="-C yabause/src/libretro HAVE_CDROM=1"

if [ "${OPENGL_SUPPORT}" = "yes" ]; then
  PKG_DEPENDS_TARGET+=" ${OPENGL}"
fi

if [ "${OPENGLES_SUPPORT}" = "yes" ]; then
  PKG_DEPENDS_TARGET+=" ${OPENGLES}"
  PKG_MAKE_OPTS_TARGET+=" FORCE_GLES=1"
fi

if [ "${VULKAN_SUPPORT}" = "yes" ]; then
  PKG_DEPENDS_TARGET+=" ${VULKAN}"
fi

if [ "${ARCH}" = "arm" ]; then
  PKG_MAKE_OPTS_TARGET+=" platform=armv"
elif [ "${ARCH}" = "aarch64" ]; then
  PKG_MAKE_OPTS_TARGET+=" platform=arm64"
fi

makeinstall_target() {
  mkdir -p ${INSTALL}/usr/lib/libretro
    cp -v yabause/src/libretro/kronos_libretro.so ${INSTALL}/usr/lib/libretro/
}
