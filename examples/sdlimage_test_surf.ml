open Sdl
module Image = Sdlimage

let () =
  let width, height = (320, 240) in
  Sdl.init [`VIDEO];
  Sdlimage.init [Image.Init_PNG];

  let window =
    Window.create
      ~title:"SDL2 Image loaded as Surface"
      ~dims:(width, height)
      ~pos:(`undefined, `undefined)
      ~flags:[]
  in
  let screen = Window.get_surface window in

  let finish () =
    Sdl.quit ();
    Sdlimage.quit ();
    print_endline "DONE!";
    exit 0
  in

  let filename = "imgs/caml_icon.png" in
  let rw = RWops.from_file ~filename ~mode:"rb" in
  let surf = Image.load_png_rw rw in

  let surf_dims = Surface.get_dims surf in
  let surf_pos = (128, 64) in

  let screen_rect = Rect.make4 0 0 width height in
  let src_rect = Rect.make4 0 0 width height in
  let dst_rect = Rect.make surf_pos surf_dims in

  let render x =
    Surface.fill_rect
      ~color:0x00_00_00l
      ~dst:screen
      ~rect:screen_rect;

    if x = width then finish ();
    let dst_rect = { dst_rect with Rect.x } in
    let _ =
      Surface.blit_surface
        ~src:surf ~dst:screen
        ~src_rect ~dst_rect
    in
    Window.update_surface window;
  in

  let rec main_loop x =
    render x;
    Timer.delay 10;
    main_loop (x + 1)
  in
  main_loop 0
