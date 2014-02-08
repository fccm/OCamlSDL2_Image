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
  = "caml_SDL_IMG_Init"

external quit : unit -> unit
  = "caml_SDL_IMG_Quit"

external get_linked_version : unit -> int * int * int
  = "caml_SDL_IMG_GetLinkedVersion"

external get_compiled_version : unit -> int * int * int
  = "caml_SDL_IMG_GetCompiledVersion"

external is_ico : Sdlrwops.t -> bool = "caml_SDL_IMG_isICO"
external is_cur : Sdlrwops.t -> bool = "caml_SDL_IMG_isCUR"
external is_bmp : Sdlrwops.t -> bool = "caml_SDL_IMG_isBMP"
external is_gif : Sdlrwops.t -> bool = "caml_SDL_IMG_isGIF"
external is_jpg : Sdlrwops.t -> bool = "caml_SDL_IMG_isJPG"
external is_lbm : Sdlrwops.t -> bool = "caml_SDL_IMG_isLBM"
external is_pcx : Sdlrwops.t -> bool = "caml_SDL_IMG_isPCX"
external is_png : Sdlrwops.t -> bool = "caml_SDL_IMG_isPNG"
external is_pnm : Sdlrwops.t -> bool = "caml_SDL_IMG_isPNM"
external is_tif : Sdlrwops.t -> bool = "caml_SDL_IMG_isTIF"
external is_xcf : Sdlrwops.t -> bool = "caml_SDL_IMG_isXCF"
external is_xpm : Sdlrwops.t -> bool = "caml_SDL_IMG_isXPM"
external is_xv : Sdlrwops.t -> bool = "caml_SDL_IMG_isXV"
external is_webp : Sdlrwops.t -> bool = "caml_SDL_IMG_isWEBP"

external load_png_rw : Sdlrwops.t -> Sdlsurface.t
  = "caml_SDL_IMG_LoadPNG_RW"

external load_ico_rw : Sdlrwops.t -> Sdlsurface.t = "caml_SDL_IMG_LoadICO_RW"
external load_cur_rw : Sdlrwops.t -> Sdlsurface.t = "caml_SDL_IMG_LoadCUR_RW"
external load_bmp_rw : Sdlrwops.t -> Sdlsurface.t = "caml_SDL_IMG_LoadBMP_RW"
external load_gif_rw : Sdlrwops.t -> Sdlsurface.t = "caml_SDL_IMG_LoadGIF_RW"
external load_jpg_rw : Sdlrwops.t -> Sdlsurface.t = "caml_SDL_IMG_LoadJPG_RW"
external load_lbm_rw : Sdlrwops.t -> Sdlsurface.t = "caml_SDL_IMG_LoadLBM_RW"
external load_pcx_rw : Sdlrwops.t -> Sdlsurface.t = "caml_SDL_IMG_LoadPCX_RW"
external load_pnm_rw : Sdlrwops.t -> Sdlsurface.t = "caml_SDL_IMG_LoadPNM_RW"
external load_tga_rw : Sdlrwops.t -> Sdlsurface.t = "caml_SDL_IMG_LoadTGA_RW"
external load_tif_rw : Sdlrwops.t -> Sdlsurface.t = "caml_SDL_IMG_LoadTIF_RW"
external load_xcf_rw : Sdlrwops.t -> Sdlsurface.t = "caml_SDL_IMG_LoadXCF_RW"
external load_xpm_rw : Sdlrwops.t -> Sdlsurface.t = "caml_SDL_IMG_LoadXPM_RW"
external load_xv_rw : Sdlrwops.t -> Sdlsurface.t = "caml_SDL_IMG_LoadXV_RW"
external load_webp_rw : Sdlrwops.t -> Sdlsurface.t = "caml_SDL_IMG_LoadWEBP_RW"

external save_png : Sdlsurface.t -> filename:string -> unit
  = "caml_SDL_IMG_SavePNG"

