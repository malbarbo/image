import color
import gleam/io
import image.{circle, crop, fill, to_svg}

pub fn main() {
  circle(40.0, [fill(color.chocolate)])
  |> crop(0.0, 0.0, 40.0, 40.0)
  |> to_svg
  |> io.println
}
