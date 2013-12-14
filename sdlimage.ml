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

