open Sdl
module Img = Sdlimage
module Surf = Surface

let () =
  let width = 320
  and height = 240 in
  Sdl.init [`VIDEO];
  Img.init [`PNG];
  let surf = Surf.create_rgb ~width ~height ~depth:8 in
  Random.self_init ();
  let img = Surf.load_bmp "../imgs/caml_icon.bmp" in
  let w, h = Surf.get_dims img in
  let rect = Rect.make4 0 0 w h in
  let rec loop rect i =
    if i > 0 then begin
      let x = Random.int (width - w)
      and y = Random.int (height - h) in
      let rect = Rect.move rect ~x ~y in
      Surf.blit_surfs surf img rect;
      loop rect (i-1)
    end
  in
  loop rect 10;
  Img.save_png surf ~filename:"saved-surf.png";
  Img.quit ();
  Sdl.quit ();
;;

