import color
import gleam/io
import image.{Bottom, Right, crop_align, ellipse, fill, to_svg}

pub fn main() {
  ellipse(80.0, 120.0, [fill(color.dodgerblue)])
  |> crop_align(Right, Bottom, 40.0, 60.0)
  |> to_svg
  |> io.println
}
