import color
import gleam/io
import image.{fill, isosceles_triangle, to_svg}

pub fn main() {
  isosceles_triangle(200.0, 170.0, [fill(color.seagreen)])
  |> to_svg
  |> io.println
}
