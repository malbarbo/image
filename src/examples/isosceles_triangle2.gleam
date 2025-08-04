import fill
import gleam/io
import image.{isosceles_triangle, to_svg}

pub fn main() {
  isosceles_triangle(60.0, 30.0, fill.aquamarine)
  |> to_svg
  |> io.println
}
