import fill
import gleam/io
import image.{right_triangle, to_svg}

pub fn main() {
  right_triangle(36.0, 48.0, fill.black)
  |> to_svg
  |> io.println
}
