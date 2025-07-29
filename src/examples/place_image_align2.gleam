import color
import gleam/io
import image.{
  Left, Top, fill, place_image_align, rectangle, rotate, to_svg, triangle,
}

pub fn main() {
  rectangle(64.0, 64.0, [fill(color.palegoldenrod)])
  |> place_image_align(
    0.0,
    0.0,
    Left,
    Top,
    triangle(48.0, [fill(color.yellowgreen)]) |> rotate(180.0),
  )
  |> to_svg
  |> io.println
}
