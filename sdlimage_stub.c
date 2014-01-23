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
#include "sdlrwops_stub.h"
#include "sdltexture_stub.h"
#include "sdlsurface_stub.h"

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

/* Functions to detect a file type, given a seekable source */

CAMLprim value caml_IMG_isICO(value img) { return Val_bool(IMG_isICO(SDL_RWops_val(img))); }
CAMLprim value caml_IMG_isCUR(value img) { return Val_bool(IMG_isCUR(SDL_RWops_val(img))); }
CAMLprim value caml_IMG_isBMP(value img) { return Val_bool(IMG_isBMP(SDL_RWops_val(img))); }
CAMLprim value caml_IMG_isGIF(value img) { return Val_bool(IMG_isGIF(SDL_RWops_val(img))); }
CAMLprim value caml_IMG_isJPG(value img) { return Val_bool(IMG_isJPG(SDL_RWops_val(img))); }
CAMLprim value caml_IMG_isLBM(value img) { return Val_bool(IMG_isLBM(SDL_RWops_val(img))); }
CAMLprim value caml_IMG_isPCX(value img) { return Val_bool(IMG_isPCX(SDL_RWops_val(img))); }
CAMLprim value caml_IMG_isPNG(value img) { return Val_bool(IMG_isPNG(SDL_RWops_val(img))); }
CAMLprim value caml_IMG_isPNM(value img) { return Val_bool(IMG_isPNM(SDL_RWops_val(img))); }
CAMLprim value caml_IMG_isTIF(value img) { return Val_bool(IMG_isTIF(SDL_RWops_val(img))); }
CAMLprim value caml_IMG_isXCF(value img) { return Val_bool(IMG_isXCF(SDL_RWops_val(img))); }
CAMLprim value caml_IMG_isXPM(value img) { return Val_bool(IMG_isXPM(SDL_RWops_val(img))); }
CAMLprim value caml_IMG_isXV (value img) { return Val_bool(IMG_isXV (SDL_RWops_val(img))); }
CAMLprim value caml_IMG_isWEBP(value img) { return Val_bool(IMG_isWEBP(SDL_RWops_val(img))); }

CAMLprim value
caml_SDL_IMG_GetCompiledVersion(value unit)
{
    CAMLparam0();
    CAMLlocal1(ret);

    SDL_version img_version;
    SDL_IMAGE_VERSION(&img_version);

    ret = caml_alloc(3, 0);
    Store_field(ret, 0, Val_int(img_version.major));
    Store_field(ret, 1, Val_int(img_version.minor));
    Store_field(ret, 2, Val_int(img_version.patch));
    CAMLreturn(ret);
}

CAMLprim value
caml_SDL_IMG_GetLinkedVersion(value unit)
{
    CAMLparam0();
    CAMLlocal1(ret);

    const SDL_version *img_version;
    img_version = IMG_Linked_Version();

    ret = caml_alloc(3, 0);
    Store_field(ret, 0, Val_int(img_version->major));
    Store_field(ret, 1, Val_int(img_version->minor));
    Store_field(ret, 2, Val_int(img_version->patch));
    CAMLreturn(ret);
}

CAMLprim value
caml_SDL_IMG_LoadPNG_RW(value img)
{
    SDL_Surface *surf =
        IMG_LoadPNG_RW(
            SDL_RWops_val(img));

    return Val_SDL_Surface(surf);
}

/* vim: set ts=4 sw=4 et: */
