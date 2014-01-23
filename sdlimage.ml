(* OCamlSDL2_Image - An OCaml interface to the SDL2_Image library
 Copyright (C) 2013 Florent Monnier
 
 This software is provided "AS-IS", without any express or implied warranty.
 In no event will the authors be held liable for any damages arising from
 the use of this software.
 
 Permission is granted to anyone to use this software for any purpose,
 including commercial applications, and to alter it and redistribute it freely.
*)
(* Image loading library *)

type init_flags =
  | Init_JPG
  | Init_PNG
  | Init_TIF
  | Init_WEBP

external init : init_flags list -> unit
  = "caml_IMG_Init"

external quit : unit -> unit
  = "caml_IMG_Quit"

external is_ico : Sdlrwops.t -> bool = "caml_IMG_isICO"
external is_cur : Sdlrwops.t -> bool = "caml_IMG_isCUR"
external is_bmp : Sdlrwops.t -> bool = "caml_IMG_isBMP"
external is_gif : Sdlrwops.t -> bool = "caml_IMG_isGIF"
external is_jpg : Sdlrwops.t -> bool = "caml_IMG_isJPG"
external is_lbm : Sdlrwops.t -> bool = "caml_IMG_isLBM"
external is_pcx : Sdlrwops.t -> bool = "caml_IMG_isPCX"
external is_png : Sdlrwops.t -> bool = "caml_IMG_isPNG"
external is_pnm : Sdlrwops.t -> bool = "caml_IMG_isPNM"
external is_tif : Sdlrwops.t -> bool = "caml_IMG_isTIF"
external is_xcf : Sdlrwops.t -> bool = "caml_IMG_isXCF"
external is_xpm : Sdlrwops.t -> bool = "caml_IMG_isXPM"
external is_xv : Sdlrwops.t -> bool = "caml_IMG_isXV"
external is_webp : Sdlrwops.t -> bool = "caml_IMG_isWEBP"

external get_linked_version : unit -> int * int * int
  = "caml_SDL_IMG_GetLinkedVersion"

external get_compiled_version : unit -> int * int * int
  = "caml_SDL_IMG_GetCompiledVersion"

external load_png_rw : Sdlrwops.t -> Sdlsurface.t
  = "caml_SDL_IMG_LoadPNG_RW"

