import color
import gleam/io
import image.{regular_polygon, stroke, to_svg}

pub fn main() {
  regular_polygon(50.0, 3, [stroke(color.red)])
  |> to_svg
  |> io.println
}
