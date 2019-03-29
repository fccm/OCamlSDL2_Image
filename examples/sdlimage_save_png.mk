.PHONY: all
all:
	$(MAKE) -f sdlimage_sample.mk FILE=sdlimage_save_png.ml

.PHONY: clean
clean:
	$(MAKE) -f sdlimage_sample.mk FILE=sdlimage_save_png.ml clean
