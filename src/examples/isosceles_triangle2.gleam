import color
import gleam/io
import image.{fill, isosceles_triangle, to_svg}

pub fn main() {
  isosceles_triangle(60.0, 30.0, [fill(color.aquamarine)])
  |> to_svg
  |> io.println
}
