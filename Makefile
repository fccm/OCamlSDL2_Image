# OCamlSDL2_Image - An OCaml interface to the SDL2_Image library
# Copyright (C) 2013 Florent Monnier
#
# This software is provided "AS-IS", without any express or implied warranty.
# In no event will the authors be held liable for any damages arising from
# the use of this software.
#
# Permission is granted to anyone to use this software for any purpose,
# including commercial applications, and to alter it and redistribute it freely.

OCAML = ocaml
OCAMLC = ocamlc
OCAMLOPT = ocamlopt
OCAMLDOC = ocamldoc
OCAMLDEP = ocamldep
OCAMLFIND = ocamlfind
OCAMLMKLIB = ocamlmklib
CC = gcc
OCAMLDIR = $(shell $(OCAMLC) -where)
DIRSEP = $(shell $(OCAML) dir_sep.ml)
OCSDLINC = -I +sdl2
OCSDLDIR = $(OCAMLDIR)/sdl2
OCSDLINCDIR = $(OCSDLDIR)/include/
SDLINCDIR = /usr/include/SDL2
DOC_DIR = doc
MKDIR = mkdir -p
RMDIR = rmdir

PKG_CONFIG = pkg-config
CFLAGS = $(shell $(PKG_CONFIG) --cflags SDL2_image)
CFLAGS += -I$(OCSDLINCDIR)
LIBS_ = $(shell $(PKG_CONFIG) --libs SDL2_image)
LIBS = $(shell $(OCAML) prm.ml $(LIBS_))

BINDINGS_DIR = sdl2_img
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
	  sdlimage.ml \
	  -d $(DOC_DIR)

.PHONY: cleandoc
cleandoc:
	$(RM) $(DOC_DIR)/*
	$(RMDIR) $(DOC_DIR)


.PHONY: edit
edit:
	$(EDITOR) sdlimage.ml sdlimage_stub.c \
	    $(SDLINCDIR)/SDL_image.h \
	    $(OCSDLINCDIR)

.PHONY: clean
clean:
	$(RM) *.[oas] *.cm[ioxta] *.cmx[as] *.so *.dll *.byte *.opt *.exe


# Dependencies

sdlimage.cmo: sdlimage.cmi
sdlimage.cmx: sdlimage.cmi
sdlimage.cmi:

