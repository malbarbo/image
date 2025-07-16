import color
import gleam/io
import image.{fill, square, to_svg}

pub fn main() {
  square(40.0, [fill(color.slateblue)])
  |> to_svg
  |> io.println
}
