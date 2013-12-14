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

PKG_CONFIG = pkg-config
CFLAGS = $(shell $(PKG_CONFIG) --cflags SDL2_image)
CFLAGS += -I/home/blue_prawn/home/gits/blue-prawn/OCamlSDL2/src
LIBS_ = $(shell $(PKG_CONFIG) --libs SDL2_image)
LIBS = $(shell $(OCAML) prm.ml $(LIBS_))

BINDINGS_DIR = sdl2_img
EDITOR = vim

.PHONY: all lib opt
all: lib opt
lib: sdl2_img.cma
opt: sdl2_img.cmxa

%.cmi: %.mli
	$(OCAMLC) $<

%.cmo: %.ml
	$(OCAMLC) -c $<

%.cmx: %.ml
	$(OCAMLOPT) -c $<

sdlimage_stub.o: sdlimage_stub.c
	$(OCAMLC) -ccopt "-static $(CFLAGS) -g -O " $<


sdl2_img.cma: sdlimage.cmo libsdlstub.a
	$(OCAMLMKLIB) -o sdl2_img -oc sdl2_stubs sdlimage.cmo $(LIBS)

sdl2_img.cmxa: sdlimage.cmx libsdlstub.a
	$(OCAMLMKLIB) -o sdl2_img -oc sdl2_stubs sdlimage.cmx $(LIBS)

libsdlstub.a: sdlimage_stub.o
	$(OCAMLMKLIB) -o sdl2_img -oc sdl2_stubs sdlimage_stub.o $(LIBS)

.PHONY: edit
edit:
	$(EDITOR) sdlimage.ml sdlimage_stub.c

.PHONY: clean
clean:
	$(RM) *.[oas] *.cm[ioxta] *.cmx[as] *.so *.dll *.opt *.exe

