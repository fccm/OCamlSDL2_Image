#load "sdl2_img.cma"

module SdlImg = Sdlimage

let () =
  SdlImg.init [
    SdlImg.Init_JPG;
    SdlImg.Init_PNG;
    SdlImg.Init_TIF;
    SdlImg.Init_WEBP;
  ];
  SdlImg.quit ();
;;

