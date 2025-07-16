import color
import gleam/io
import image.{circle, fill, to_svg}

pub fn main() {
  circle(20.0, [fill(color.blue)])
  |> to_svg
  |> io.println
}
