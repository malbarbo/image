import fill
import gleam/io
import image.{circle, crop, to_svg}

pub fn main() {
  circle(40.0, fill.chocolate)
  |> crop(0.0, 0.0, 40.0, 40.0)
  |> to_svg
  |> io.println
}
