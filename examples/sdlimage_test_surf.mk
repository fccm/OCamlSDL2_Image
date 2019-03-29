.PHONY: all
all:
	$(MAKE) -f sdlimage_sample.mk FILE=sdlimage_test_surf.ml

.PHONY: clean
clean:
	$(MAKE) -f sdlimage_sample.mk FILE=sdlimage_test_surf.ml clean
