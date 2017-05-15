## Building on Gentoo

### Bootstrap the toolchain
Use `~amd64` on the packages to builld

```
USE=bootstrap emerge dev-lang/gnat-gpl
USE="bootstrap -shared -gtk" emerge dev-ada/gprbuild
# rebuild to be used as a shared lib, no gtk, but projects needed for Muen
USE="-bootstrap -gtk projects" emerge dev-ada/gnatcoll dev-ada/gprbuild
emerge dev-ada/xmlada htmltidy # for building libmuxml
# for graphics in PDFs from `mugenschedcfg`
USE=cairo emerge sci-visualization/gnuplot
# for creating images with grub-mkrescue
emerge sys-fs/mtools dev-libs/libisoburn
```

### Additional tools not included
Download [sparkgpl](http://mirrors.cdn.adacore.com/art/5739d613c7a447658e0b0189)
(SHA1: `829f2f5879391977058cc08dbf66cc472112c9c7`) for the `gnatprove` binary
and add it to `$PATH`. It is used to compile some tools and the kernel.
You can use `xorriso` from the `dev-libs/libusoburn` package or on its own:
Download [xorriso](https://www.gnu.org/software/xorriso/xorriso-1.4.6.tar.gz)
(SHA1: `│bb8a2d9587784495818e374a56cc5318a4e8580b`), build it, and add it to
`$PATH` as well. It is required for building a bootable ISO image.

### `adabfd` on Gentoo
There is a second `bfd.h` in `/usr/include` without the `BFS_KEEP_H` symbol.
```
export CFLAGS=-I/usr/lib/binutils/x86_64-pc-linux-gnu/2.26.1/include
```

### Building the tools
```
make tools
```
