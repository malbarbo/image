import color
import gleam/io
import image.{rectangle, stroke, to_svg}

pub fn main() {
  rectangle(40.0, 20.0, [stroke(color.black)])
  |> to_svg
  |> io.println
}
