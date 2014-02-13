# EupsPkg config file. Sourced by 'eupspkg'

# Breaks on Darwin w/o this
export LANG=C

config()
{
    sed -i "s/PLAT= none/PLAT= linux/" Makefile &&
    sed -i "s,INSTALL_TOP= /usr/local,INSTALL_TOP= ${PREFIX}," Makefile &&
    sed -i "s,CFLAGS= -O2,CFLAGS= -I${PREFIX}/include -fPIC -O2," src/Makefile &&
    sed -i "s,LIBS= -lm,LIBS= -L${PREFIX}/lib -lm," src/Makefile &&
    sed -i "s,#define LUA_ROOT\t\"/usr/local/\",#define LUA_ROOT\t\"${PREFIX}/\"," src/luaconf.h
}