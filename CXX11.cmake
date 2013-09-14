# Copyright (c) 2013 Nathan Osman
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.

# Ensures that the compiler supports C++11
macro(require_cxx11_compiler)
    # Microsoft Visual C++ 2010+ is required
    if(MSVC)
        if(NOT MSVC10)
            message(FATAL_ERROR "Visual C++ 2010+ is required (${MSVC_VERSION} detected).")
        endif()
    # GCC 4.6+ is required
    elseif(CMAKE_COMPILER_IS_GNUCXX)
        if(${CMAKE_CXX_COMPILER_VERSION} VERSION_LESS 4.6)
            message(FATAL_ERROR "GCC 4.6+ is required (${CMAKE_CXX_COMPILER_VERSION} detected).")
        endif()
    # Clang 3.1+ is required
    elseif(CMAKE_CXX_COMPILER_ID STREQUAL "Clang")
        if(${CMAKE_CXX_COMPILER_VERSION} VERSION_LESS 3.1)
            message(FATAL_ERROR "Clang 3.1+ is required (${CMAKE_CXX_COMPILER_VERSION} detected).")
        endif()
    # Assume that the compiler does not support C++11
    else()
        message(FATAL_ERROR "${CMAKE_CXX_COMPILER_ID} does not appear to support C++11.")
    endif()
endmacro()

# Sets the appropriate flag to enable C++11 support
macro(enable_cxx11)
    if(CMAKE_COMPILER_IS_GNUCXX OR CMAKE_CXX_COMPILER_ID STREQUAL "Clang")
        set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++0x")
    endif()
endmacro()

