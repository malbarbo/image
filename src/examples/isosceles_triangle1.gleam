import fill
import gleam/io
import image.{isosceles_triangle, to_svg}

pub fn main() {
  isosceles_triangle(200.0, 170.0, fill.seagreen)
  |> to_svg
  |> io.println
}
