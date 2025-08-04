import fill
import gleam/io
import image.{Bottom, Right, place_image_align, rectangle, to_svg, triangle}

pub fn main() {
  rectangle(64.0, 64.0, fill.palegoldenrod)
  |> place_image_align(
    64.0,
    64.0,
    Right,
    Bottom,
    triangle(48.0, fill.yellowgreen),
  )
  |> to_svg
  |> io.println
}
