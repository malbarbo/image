import color
import gleam/io
import image.{rectangle, rotate, stroke, to_svg}

pub fn main() {
  rectangle(50.0, 50.0, [stroke(color.black)])
  |> rotate(5.0)
  |> to_svg
  |> io.println
}
