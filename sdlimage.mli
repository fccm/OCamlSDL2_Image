(* OCamlSDL2_Image - An OCaml interface to the SDL2_Image library
 Copyright (C) 2013 Florent Monnier
 
 This software is provided "AS-IS", without any express or implied warranty.
 In no event will the authors be held liable for any damages arising from
 the use of this software.
 
 Permission is granted to anyone to use this software for any purpose,
 including commercial applications, and to alter it and redistribute it freely.
*)
(** Image loading library *)

(** SDL_image module for SDL2
  
  {{:http://www.libsdl.org/projects/SDL_image/}
    Project Home Page}
  
  {{:http://www.libsdl.org/projects/SDL_image/docs/SDL_image.html}
    API Doc}
*)

type init_flags = Init_JPG | Init_PNG | Init_TIF | Init_WEBP

external init : init_flags list -> unit = "caml_IMG_Init"
external quit : unit -> unit = "caml_IMG_Quit"

external get_linked_version : unit -> int * int * int
  = "caml_SDL_IMG_GetLinkedVersion"

external get_compiled_version : unit -> int * int * int
  = "caml_SDL_IMG_GetCompiledVersion"


(** {4 File Format} *)

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


(** {4 Loading} *)

external load_png_rw : Sdlrwops.t -> Sdlsurface.t
  = "caml_SDL_IMG_LoadPNG_RW"
(** {{:http://www.libsdl.org/projects/SDL_image/docs/SDL_image_24.html}
    api doc} *)

external load_ico_rw : Sdlrwops.t -> Sdlsurface.t = "caml_SDL_IMG_LoadICO_RW"
(**{{:http://www.libsdl.org/projects/SDL_image/docs/SDL_image_15.html}api doc}*)

external load_cur_rw : Sdlrwops.t -> Sdlsurface.t = "caml_SDL_IMG_LoadCUR_RW"
(**{{:http://www.libsdl.org/projects/SDL_image/docs/SDL_image_14.html}api doc}*)

external load_bmp_rw : Sdlrwops.t -> Sdlsurface.t = "caml_SDL_IMG_LoadBMP_RW"
(**{{:http://www.libsdl.org/projects/SDL_image/docs/SDL_image_16.html}api doc}*)

external load_gif_rw : Sdlrwops.t -> Sdlsurface.t = "caml_SDL_IMG_LoadGIF_RW"
(**{{:http://www.libsdl.org/projects/SDL_image/docs/SDL_image_21.html}api doc}*)

external load_jpg_rw : Sdlrwops.t -> Sdlsurface.t = "caml_SDL_IMG_LoadJPG_RW"
(**{{:http://www.libsdl.org/projects/SDL_image/docs/SDL_image_22.html}api doc}*)

external load_lbm_rw : Sdlrwops.t -> Sdlsurface.t = "caml_SDL_IMG_LoadLBM_RW"
(**{{:http://www.libsdl.org/projects/SDL_image/docs/SDL_image_26.html}api doc}*)

external load_pcx_rw : Sdlrwops.t -> Sdlsurface.t = "caml_SDL_IMG_LoadPCX_RW"
(**{{:http://www.libsdl.org/projects/SDL_image/docs/SDL_image_20.html}api doc}*)

external load_pnm_rw : Sdlrwops.t -> Sdlsurface.t = "caml_SDL_IMG_LoadPNM_RW"
(**{{:http://www.libsdl.org/projects/SDL_image/docs/SDL_image_17.html}api doc}*)

external load_tga_rw : Sdlrwops.t -> Sdlsurface.t = "caml_SDL_IMG_LoadTGA_RW"
(**{{:http://www.libsdl.org/projects/SDL_image/docs/SDL_image_25.html}api doc}*)

external load_tif_rw : Sdlrwops.t -> Sdlsurface.t = "caml_SDL_IMG_LoadTIF_RW"
(**{{:http://www.libsdl.org/projects/SDL_image/docs/SDL_image_23.html}api doc}*)

external load_xcf_rw : Sdlrwops.t -> Sdlsurface.t = "caml_SDL_IMG_LoadXCF_RW"
(**{{:http://www.libsdl.org/projects/SDL_image/docs/SDL_image_19.html}api doc}*)

external load_xpm_rw : Sdlrwops.t -> Sdlsurface.t = "caml_SDL_IMG_LoadXPM_RW"
(**{{:http://www.libsdl.org/projects/SDL_image/docs/SDL_image_18.html}api doc}*)

external load_xv_rw : Sdlrwops.t -> Sdlsurface.t = "caml_SDL_IMG_LoadXV_RW"
(**{{:http://www.libsdl.org/projects/SDL_image/docs/SDL_image_27.html}api doc}*)

external load_webp_rw : Sdlrwops.t -> Sdlsurface.t = "caml_SDL_IMG_LoadWEBP_RW"


(** {4 Saving} *)

external save_png : Sdlsurface.t -> filename:string -> unit
  = "caml_SDL_IMG_SavePNG"

