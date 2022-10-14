# Overview
The document describes how to compile the underlying Python-C binding library.

# Requirements
Python and gcc to be installed.

## IMPORTANT
Include a separate C header file to create the library because the CFFI Python Library has limitations
- It DOESN'T support #include directives
- It DOESN'T support strings in the #define
- It DOESN'T support _Bool type, replace with "unsigned char" 

# Compilation
To compile the library, run:
```
> python3 py_cffi_lib_build.py
```
