import color
import gleam/io
import image.{circle, outline, to_svg}

pub fn main() {
  circle(30.0, [outline(color.red)])
  |> to_svg
  |> io.println
}
