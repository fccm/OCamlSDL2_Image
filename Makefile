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
OCSDLINCDIR = $(OCAMLDIR)/sdl2/include/
SDLINCDIR = /usr/include/SDL2

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
	$(OCAMLC) -c $<

%.cmo: %.ml
	$(OCAMLC) -c -I +sdl2 $<

%.cmx: %.ml
	$(OCAMLOPT) -c -I +sdl2 $<

sdlimage_stub.o: sdlimage_stub.c
	$(OCAMLC) -ccopt "-static $(CFLAGS) -g -O " $<


sdl2_img.cma: sdlimage.cmo libsdl2img_stubs.a
	$(OCAMLMKLIB) -o sdl2_img -oc sdl2img_stubs sdlimage.cmo $(LIBS)

sdl2_img.cmxa: sdlimage.cmx libsdl2img_stubs.a
	$(OCAMLMKLIB) -o sdl2_img -oc sdl2img_stubs sdlimage.cmx $(LIBS)

libsdl2img_stubs.a: sdlimage_stub.o
	$(OCAMLMKLIB) -o sdl2_img -oc sdl2img_stubs sdlimage_stub.o $(LIBS)

.PHONY: edit
edit:
	$(EDITOR) sdlimage.ml sdlimage_stub.c \
	    $(SDLINCDIR)/SDL_image.h \
	    $(OCSDLINCDIR)

.PHONY: clean
clean:
	$(RM) *.[oas] *.cm[ioxta] *.cmx[as] *.so *.dll *.opt *.exe

