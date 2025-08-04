import gleam/io
import image.{square, to_svg}
import stroke

pub fn main() {
  square(50.0, stroke.darkmagenta)
  |> to_svg
  |> io.println
}
