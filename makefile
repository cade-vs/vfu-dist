
### MAKEMAKE STARTS HERE #######################################################


### Created by makemake.pl on Sun Dec 15 20:23:25 2002 #########################


### GLOBAL TARGETS #############################################################

default: all

re: rebuild

li: link

all: modules 

clean: clean-modules 

rebuild: rebuild-modules 

link: link-modules 

### GLOBAL (AND USER) DEFS #####################################################


AR = ar rv
CC = gcc
LD = gcc
MKDIR = mkdir -p
MODULES = vslib vfu
RANLIB = ranlib
RMDIR = rm -rf
RMFILE = rm -f
SRC = *.c *.cpp *.cc *.cxx


### MODULES ####################################################################

modules:
	make -C vslib 
	make -C vfu 

clean-modules:
	make -C vslib clean
	make -C vfu clean

rebuild-modules:
	make -C vslib rebuild
	make -C vfu rebuild

link-modules:
	make -C vslib link
	make -C vfu link


### MAKEMAKE ENDS HERE #########################################################

