import color
import gleam/io
import image.{fill, to_svg, triangle}

pub fn main() {
  triangle(40.0, [fill(color.tan)])
  |> to_svg
  |> io.println
}
