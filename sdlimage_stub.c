/* OCamlSDL2_Image - An OCaml interface to the SDL2_Image library
 Copyright (C) 2013 Florent Monnier
 
 This software is provided "AS-IS", without any express or implied warranty.
 In no event will the authors be held liable for any damages arising from
 the use of this software.
 
 Permission is granted to anyone to use this software for any purpose,
 including commercial applications, and to alter it and redistribute it freely.
*/
#define CAML_NAME_SPACE
#include <caml/mlvalues.h>
#include <caml/memory.h>
#include <caml/alloc.h>
#include <caml/fail.h>

#include <SDL_image.h>

static const IMG_InitFlags
caml_sdl2img_initflags_table[] = {
    IMG_INIT_JPG,
    IMG_INIT_PNG,
    IMG_INIT_TIF,
    IMG_INIT_WEBP,
};

#define IMG_InitFlag_ml2c(v) \
    caml_sdl2img_initflags_table[Long_val(v)];

static inline IMG_InitFlags
IMG_InitFlags_val(value flag_list)
{
    IMG_InitFlags c_mask = 0;
    while (flag_list != Val_emptylist)
    {
        value head = Field(flag_list, 0);
        flag_list = Field(flag_list, 1);
        c_mask |= IMG_InitFlag_ml2c(head);
    }
    return c_mask;
}

CAMLprim value
caml_IMG_Init(value flags)
{
    IMG_InitFlags c_flags = IMG_InitFlags_val(flags);
    int si = IMG_Init(c_flags);
    if (si == 0) caml_failwith("Sdlimage.init");
    if (si != c_flags) caml_failwith("Sdlimage.init: "
        "uncomplete initialisation");
    return Val_unit;
}

CAMLprim value
caml_IMG_Quit(value unit)
{
    IMG_Quit();
    return Val_unit;
}

#define SDL_RWops_val(v)  ((SDL_RWops *)(v))

CAMLprim value caml_IMG_isBMP(value img) { return Val_bool(IMG_isBMP(SDL_RWops_val(img))); }
CAMLprim value caml_IMG_isGIF(value img) { return Val_bool(IMG_isGIF(SDL_RWops_val(img))); }
CAMLprim value caml_IMG_isJPG(value img) { return Val_bool(IMG_isJPG(SDL_RWops_val(img))); }
CAMLprim value caml_IMG_isLBM(value img) { return Val_bool(IMG_isLBM(SDL_RWops_val(img))); }
CAMLprim value caml_IMG_isPCX(value img) { return Val_bool(IMG_isPCX(SDL_RWops_val(img))); }
CAMLprim value caml_IMG_isPNG(value img) { return Val_bool(IMG_isPNG(SDL_RWops_val(img))); }
CAMLprim value caml_IMG_isPNM(value img) { return Val_bool(IMG_isPNM(SDL_RWops_val(img))); }
CAMLprim value caml_IMG_isTIF(value img) { return Val_bool(IMG_isTIF(SDL_RWops_val(img))); }

/* vim: set ts=4 sw=4 et: */
