import fill
import gleam/io
import image.{isosceles_triangle, to_svg}

pub fn main() {
  isosceles_triangle(60.0, 330.0, fill.lightseagreen)
  |> to_svg
  |> io.println
}
