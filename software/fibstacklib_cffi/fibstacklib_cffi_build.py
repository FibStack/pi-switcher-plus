from cffi import FFI
import pathlib

ffi = FFI()

lib_dir = pathlib.Path().absolute()
header = lib_dir / "fibstack.h"

with open(header) as h_file:
    ffi.cdef(h_file.read())

ffi.set_source("fibstacklib_cffi",
"""
    #include "i2clib.h"
    #include "fibstack.h"
""",
    sources=['../libfibstack/libfibstack.c', '../libfibstack/i2clib.c'])

if __name__ == "__main__":
    ffi.compile(verbose=True)
