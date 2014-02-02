all:
	ocamlopt -g \
	  -I +sdl2 sdl2.cmxa \
	  -I . sdl2_img.cmxa \
	  -o sdlimage_test_surf.opt \
	  sdlimage_test_surf.ml
