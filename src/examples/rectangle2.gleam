import color
import gleam/io
import image.{fill, rectangle, to_svg}

pub fn main() {
  rectangle(20.0, 40.0, [fill(color.black)])
  |> to_svg
  |> io.println
}
