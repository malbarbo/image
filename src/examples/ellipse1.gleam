import color
import gleam/io
import image.{ellipse, stroke, to_svg}

pub fn main() {
  ellipse(60.0, 30.0, [stroke(color.black)])
  |> to_svg
  |> io.println
}
