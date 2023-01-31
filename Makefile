PKG_CONFIG?=pkg-config
YASCREEN_LD?=$(shell $(PKG_CONFIG) --libs yascreen)
NCURSES_LD?=$(shell $(PKG_CONFIG) --libs ncursesw)

BINS:=vfu/vfu vfu/vfu.yas
ifeq ($(YASCREEN_LD),)
	BINS:=$(filter-out vfu/vfu.yas,$(BINS))
endif
ifeq ($(NCURSES_LD),)
	BINS:=$(filter-out vfu/vfu,$(BINS))
endif

ifeq ("$(V)","1")
Q:=
E:=@true
else
Q:=@
E:=@echo
endif

all: $(BINS)

vfu/vfu: vstring/libvstring.a vslib/libvslib.a vslib/libvscon.a
	$(E) MAKE vfu
	$(Q)$(MAKE) -C vfu vfu

vfu/vfu.yas: vstring/libvstring.a vslib/libvslib.a vslib/libvscony.a
	$(E) MAKE vfu.yas
	$(Q)$(MAKE) -C vfu vfu.yas

vstring/libvstring.a:
	$(E) MAKE libvstring.a
	$(Q)$(MAKE) -C vstring libvstring.a

vslib/libvslib.a:
	$(E) MAKE libvslib.a
	$(Q)$(MAKE) -C vslib libvslib.a

vslib/libvscon.a:
	$(E) MAKE libvscon.a
	$(Q)$(MAKE) -C vslib libvscon.a

vslib/libvscony.a:
	$(E) MAKE libvscony.a
	$(MAKE) -C vslib libvscony.a

clean: clean-vslib clean-vstring clean-vfu

clean-vslib:
	$(E) CLEAN vslib
	$(Q)$(MAKE) --no-print-directory -C vslib clean

clean-vstring:
	$(E) CLEAN vstring
	$(Q)$(MAKE) --no-print-directory -C vstring clean

clean-vfu:
	$(E) CLEAN vfu
	$(Q)$(MAKE) --no-print-directory -C vfu clean

re:
	$(Q)$(MAKE) --no-print-directory clean
	$(Q)$(MAKE) --no-print-directory -j

.PHONY: all clean clean-vfu clean-vslib clean-vstring re
