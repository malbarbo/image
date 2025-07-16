import color
import gleam/io
import image.{outline, square, to_svg}

pub fn main() {
  square(50.0, [outline(color.darkmagenta)])
  |> to_svg
  |> io.println
}
