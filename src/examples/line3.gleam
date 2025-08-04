import color
import gleam/io
import image.{line, stroke, to_svg}

pub fn main() {
  line(30.0, -20.0, [stroke(color.red)])
  |> to_svg
  |> io.println
}
