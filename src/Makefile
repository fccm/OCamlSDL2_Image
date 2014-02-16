# OCamlSDL2_Image - An OCaml interface to the SDL2_Image library
# Copyright (C) 2013 Florent Monnier
#
# This software is provided "AS-IS", without any express or implied warranty.
# In no event will the authors be held liable for any damages arising from
# the use of this software.
#
# Permission is granted to anyone to use this software for any purpose,
# including commercial applications, and to alter it and redistribute it freely.

OCAMLFIND = ocamlfind
USEFIND = $(shell which $(OCAMLFIND) 2>/dev/null)

ifdef USEFIND
OCAMLC = $(OCAMLFIND) ocamlc
OCAMLOPT = $(OCAMLFIND) ocamlopt
OCSDLINC = -package sdl2
else
OCAMLC = ocamlc
OCAMLOPT = ocamlopt
OCSDLINC = -I +sdl2
endif

OCAMLMKLIB = ocamlmklib
OCAMLDOC = ocamldoc
OCAMLDEP = ocamldep
OCAML = ocaml
CC = gcc
OCAMLDIR = $(shell $(OCAMLC) -where)
DIRSEP = $(shell $(OCAML) dir_sep.ml)
OCSDLDIR = $(OCAMLDIR)/sdl2
OCSDLINCDIR = $(OCSDLDIR)/include/
SDLINCDIR = /usr/include/SDL2
DOC_DIR = doc
MKDIR = mkdir -p
RMDIR = rmdir

BINDINGS_DIR := sdl2_img
PREFIX := 
DESTDIR := $(PREFIX)$(DIRSEP)$(OCAMLDIR)$(DIRSEP)$(BINDINGS_DIR)
UNINSTALL_DIR := rm -Rf
INSTALL_DIR := mkdir -p
INSTALL_FILES := cp -f

PKG_CONFIG = pkg-config
CFLAGS = $(shell $(PKG_CONFIG) --cflags SDL2_image)
CFLAGS += -I$(OCSDLINCDIR)
LIBS_ = $(shell $(PKG_CONFIG) --libs SDL2_image)
LIBS = $(shell $(OCAML) prm.ml $(LIBS_))

EDITOR = vim

.PHONY: all lib opt
all: lib opt
lib: sdl2_img.cma
opt: sdl2_img.cmxa

%.cmi: %.mli
	$(OCAMLC) -c $(OCSDLINC) $<

%.cmo: %.ml
	$(OCAMLC) -c $(OCSDLINC) $<

%.cmx: %.ml
	$(OCAMLOPT) -c $(OCSDLINC) $<

sdlimage_stub.o: sdlimage_stub.c
	$(OCAMLC) -ccopt "-static $(CFLAGS) -g -O " $<


sdl2_img.cma: sdlimage.cmo libsdl2img_stubs.a
	$(OCAMLMKLIB) -o sdl2_img -oc sdl2img_stubs sdlimage.cmo $(LIBS)

sdl2_img.cmxa: sdlimage.cmx libsdl2img_stubs.a
	$(OCAMLMKLIB) -o sdl2_img -oc sdl2img_stubs sdlimage.cmx $(LIBS)

libsdl2img_stubs.a: sdlimage_stub.o
	$(OCAMLMKLIB) -o sdl2_img -oc sdl2img_stubs sdlimage_stub.o $(LIBS)


# API documentation generation

OCAMLDOC_PRM = -colorize-code -html
OCAMLDOC_INC = $(OCSDLINC)

.PHONY: doc
doc: sdlimage.cmo
	$(MKDIR) $(DOC_DIR)
	$(OCAMLDOC) \
	  $(OCAMLDOC_PRM) \
	  $(OCAMLDOC_INC) \
	  sdlimage.mli \
	  -d $(DOC_DIR)

.PHONY: cleandoc
cleandoc:
	$(RM) $(DOC_DIR)/*
	$(RMDIR) $(DOC_DIR)


.PHONY: edit
edit:
	$(EDITOR) \
	  sdlimage.mli \
	  sdlimage.ml \
	  sdlimage_stub.c \
	    $(SDLINCDIR)/SDL_image.h \
	    $(OCSDLINCDIR) \
	    $(SDLINCDIR)

.PHONY: clean
clean:
	$(RM) *.[oas] *.cm[ioxta] *.cmx[as] *.so *.dll *.byte *.opt *.exe


# Findlib Installation

.PHONY: install uninstall reinstall

install: META sdl2_img.cma

ifdef USEFIND
install:
	$(OCAMLFIND) install $(BINDINGS_DIR) META \
	  *.cm[aix] *.cmx[as] sdl2*.a *sdl2*_stubs.*
uninstall:
	$(OCAMLFIND) remove $(BINDINGS_DIR)
else
install:
	$(INSTALL_DIR) $(DESTDIR)
	$(INSTALL_FILES) \
	  *.cm[aix] *.cmx[as] sdl2*.a *sdl2*_stubs.* \
	  $(DESTDIR)
uninstall:
	$(UNINSTALL_DIR) $(DESTDIR)
endif

reinstall:
	$(MAKE) clean
	$(MAKE) all
	$(MAKE) uninstall
	$(MAKE) install


# Manual Installation

INSTALL_DIR = install -d -m 0755
INSTALL_EXE = install -m 0755
INSTALL_FILE = install -D -m 0644

.PHONY: manualinstall
manualinstall:
	$(INSTALL_DIR) $(OCSDLDESTDIR)
	$(INSTALL_FILE) META \
	  *.cm[aix] *.cmx[as] sdl2*.a libsdl2*_stubs.* \
	  $(OCSDLDESTDIR)
	$(INSTALL_EXE) \
	  dllsdl2img_stubs.* \
	  $(OCSDLSTUBDIR)


# Dependencies

sdlimage.cmo: sdlimage.cmi
sdlimage.cmx: sdlimage.cmi
sdlimage.cmi:

