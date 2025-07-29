import color
import gleam/io
import image.{
  Bottom, Right, fill, place_image_align, rectangle, to_svg, triangle,
}

pub fn main() {
  rectangle(64.0, 64.0, [fill(color.palegoldenrod)])
  |> place_image_align(
    64.0,
    64.0,
    Right,
    Bottom,
    triangle(48.0, [fill(color.yellowgreen)]),
  )
  |> to_svg
  |> io.println
}
