import color
import gleam/io
import image.{Left, Top, circle, crop_align, fill, to_svg}

pub fn main() {
  circle(40.0, [fill(color.chocolate)])
  |> crop_align(Left, Top, 40.0, 40.0)
  |> to_svg
  |> io.println
}
