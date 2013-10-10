
### MAKEMAKE STARTS HERE #######################################################


### Created by makemake.pl on Fri Oct 11 01:45:14 2013 #########################


### GLOBAL TARGETS #############################################################

default: mm_update all

re: mm_update rebuild

li: mm_update link

all: mm_update modules 

clean: mm_update clean-modules 

rebuild: mm_update rebuild-modules 

link: mm_update link-modules 

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
	$(MAKE) -C vslib 
	$(MAKE) -C vfu 

clean-modules:
	$(MAKE) -C vslib clean
	$(MAKE) -C vfu clean

rebuild-modules:
	$(MAKE) -C vslib rebuild
	$(MAKE) -C vfu rebuild

link-modules:
	$(MAKE) -C vslib link
	$(MAKE) -C vfu link


mm_update:
	


### MAKEMAKE ENDS HERE #########################################################

