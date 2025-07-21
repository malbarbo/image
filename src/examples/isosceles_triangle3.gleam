import color
import gleam/io
import image.{fill, isosceles_triangle, to_svg}

pub fn main() {
  isosceles_triangle(60.0, 330.0, [fill(color.lightseagreen)])
  |> to_svg
  |> io.println
}
