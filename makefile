### MAKEMAKE STARTS HERE #########################################
#
# Created by makemake.pl on Fri Nov  8 01:50:34 2002
#
##################################################################

### GLOBAL TARGETS ###############################################

default: all

re: rebuild


li: link

all: modules 

clean: clean-modules 

rebuild: rebuild-modules 

link: link-modules 

### GLOBAL DEFS ##################################################

MKDIR      = mkdir -p
RMDIR      = rm -rf
RMFILE     = rm -f

### MODULES #####################################################

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


### MAKEMAKE ENDS HERE ###########################################
