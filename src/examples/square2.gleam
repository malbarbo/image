import color
import gleam/io
import image.{square, stroke, to_svg}

pub fn main() {
  square(50.0, [stroke(color.darkmagenta)])
  |> to_svg
  |> io.println
}
