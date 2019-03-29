# Compile sample OCaml programs calling SDL_image 2.0
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
OCAMLRUN = ocamlrun

OCAMLSDL2_DIR="$(shell pwd)/../../OCamlSDL2/src"
OCAMLSDL2_IMG_DIR="$(shell pwd)/../src"

#OCAMLSDL2_DIR="+sdl2"
#OCAMLSDL2_IMG_DIR="+sdl2-img"

EDITOR = vim

FILE =
SAMPLE = $(shell basename $(FILE) .ml)

.PHONY: all byte opt
all: opt
byte: $(SAMPLE).byte
opt: $(SAMPLE).opt

# Compile the test

$(SAMPLE).opt: $(FILE)
	$(OCAMLOPT) \
	  -I $(OCAMLSDL2_DIR) sdl2.cmxa \
	  -I $(OCAMLSDL2_IMG_DIR) sdl2_img.cmxa \
	  $< -o $@

$(SAMPLE).byte: $(FILE)
	$(OCAMLC) \
	  -I $(OCAMLSDL2_DIR) sdl2.cma \
	  -I $(OCAMLSDL2_IMG_DIR) sdl2_img.cma \
	  $< -o $@


# Running the test

TESTIMG = ../imgs/caml_icon.png

.PHONY: run
run: $(SAMPLE).byte
	$(OCAMLRUN) \
	  -I $(OCAMLSDL2_DIR) \
	  -I $(OCAMLSDL2_IMG_DIR) \
	  $< $(TESTIMG)

.PHONY: runopt
runopt: $(SAMPLE).opt
	./$< $(TESTIMG)


.PHONY: edit
edit:
	$(EDITOR) $(FILE)

.PHONY: clean
clean:
	$(RM) \
	  $(SAMPLE).cmi \
	  $(SAMPLE).cmx \
	  $(SAMPLE).o \
	  $(SAMPLE).opt \
	  $(SAMPLE).byte \
	  #End

