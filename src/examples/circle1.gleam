import color
import gleam/io
import image.{circle, stroke, to_svg}

pub fn main() {
  circle(30.0, [stroke(color.red)])
  |> to_svg
  |> io.println
}
