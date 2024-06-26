ifeq ($(COMPILER),GNU_CC)

#    ifeq ($(BMOPTFLAGS),-DBMAVX512OPT)
#        CXXARCHFLAGS=-march=skylake-avx512 -mtune=skylake-avx512
#    else
#        ifeq ($(BMOPTFLAGS),-DBMAVX2OPT)
#            CXXARCHFLAGS=-march=skylake -mavx2
#        else
#            ifeq ($(BMOPTFLAGS),-DBMSSE42OPT)
#                CXXARCHFLAGS=-march=core2 -msse4.2
#            else
#                ifeq ($(BMOPTFLAGS),-DBMSSE2OPT)
#                    CXXARCHFLAGS=-march=core2 -msse2
#                else
#                    CXXARCHFLAGS=-march=core2
#                endif
#            endif
#        endif
#    endif
    COMMON_DFLAGS = 
    #-g -D_DEBUG
    LINKER_DFLAGS = 
    #-g

    OS_VER = -D__$(shell uname -s)_$(shell uname -r | sed -e 's/\./_/g' -e 's/-.*//')
    PLATFORM_CXXFLAGS = -D_REENTRANT $(OS_VER) -D_GNU_SOURCE -std=c++17 -Wall -Wextra -Werror=uninitialized -Wshadow -Wconversion -Wmissing-declarations -Wswitch-default -Wimplicit-fallthrough
    PLATFORM_CFLAGS = -D_REENTRANT $(OS_VER)
    COMMON_LDFLAGS = $(LINKER_DFLAGS) -Wl,-stack_size,0x10000000 -rdynamic -lz
    COMMON_CLDFLAGS = $(COMMON_LDFLAGS)
    EXTERN_LIBS = $(EXTERN_LIBS_BASE)/lib
    CXX = g++ $(CXXARCHFLAGS) -Wall -Wc++11-extensions 
    CC = gcc $(CXXARCHFLAGS) -Wall
    LD = g++ $(COMMON_LDFLAGS)
    CC_PIC_FLAGS = -fPIC
    CXX_PIC_FLAGS = -fPIC
    OPT_FLAGS = -g0 -O2
    SO_FLAGS = -shared
    SO_LIBS =

    ##SYS_LIBS = -lpthread -ldl -lrt -lz
endif

##SYS_LIBS = -lpthread -ldl -lrt

COMMON_CXXFLAGS = $(COMMON_DFLAGS) $(PLATFORM_CXXFLAGS)
COMMON_CFLAGS = $(COMMON_DFLAGS) $(PLATFORM_CFLAGS)
INSTALL = /usr/bin/install
INSTALLDIR = /usr/bin/install -d
AWK = awk
TEST = /usr/bin/test

