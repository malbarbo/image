import color
import gleam/io
import image.{fill, right_triangle, to_svg}

pub fn main() {
  right_triangle(36.0, 48.0, [fill(color.black)])
  |> to_svg
  |> io.println
}
