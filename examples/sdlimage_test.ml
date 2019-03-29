module SdlImg = Sdlimage

let is_imgs = [
  "ico", SdlImg.is_ico;
  "cur", SdlImg.is_cur;
  "bmp", SdlImg.is_bmp;
  "gif", SdlImg.is_gif;
  "jpg", SdlImg.is_jpg;
  "lbm", SdlImg.is_lbm;
  "pcx", SdlImg.is_pcx;
  "png", SdlImg.is_png;
  "pnm", SdlImg.is_pnm;
  "tif", SdlImg.is_tif;
  "xcf", SdlImg.is_xcf;
  "xpm", SdlImg.is_xpm;
  "xv", SdlImg.is_xv;
  "webp", SdlImg.is_webp;
]

let () =
  let filename = Sys.argv.(1) in
  SdlImg.init [
    `JPG;
    `PNG;
    `TIF;
    `WEBP;
  ];
  let rwo = Sdlrwops.from_file ~filename ~mode:"rb" in
  let found = ref false in
  List.iter (fun (ext, is_img) ->
    if is_img rwo then
    begin
      Printf.printf "\"%s\" is %s\n" filename ext;
      found := true
    end
  ) is_imgs;
  if not !found then
    Printf.printf "unknown filetype for \"%s\"\n" filename;
  SdlImg.quit ();
;;

