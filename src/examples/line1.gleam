import color
import gleam/io
import image.{line, stroke, to_svg}

pub fn main() {
  line(30.0, 30.0, [stroke(color.black)])
  |> to_svg
  |> io.println
}
