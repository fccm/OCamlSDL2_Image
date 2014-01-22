# Sample program to test image type with Sdl2_img
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

OCAMLSDL2_DIR="$(shell pwd)/../OCamlSDL2/src"
OCAMLSDL2_IMG_DIR="."

.PHONY: all byte opt
all: opt
byte: sdlimage_test.byte
opt: sdlimage_test.opt

sdlimage_test.opt: sdlimage_test.ml
	$(OCAMLOPT) \
	  -I $(OCAMLSDL2_DIR) sdl2.cmxa \
	  -I $(OCAMLSDL2_IMG_DIR) sdl2_img.cmxa \
	  $< -o $@

sdlimage_test.byte: sdlimage_test.ml
	$(OCAMLC) \
	  -I $(OCAMLSDL2_DIR) sdl2.cma \
	  -I $(OCAMLSDL2_IMG_DIR) sdl2_img.cma \
	  $< -o $@

.PHONY: edit
edit:
	$(EDITOR) sdlimage_test.ml

.PHONY: clean
clean:
	$(RM) sdlimage_test.opt sdlimage_test.byte

