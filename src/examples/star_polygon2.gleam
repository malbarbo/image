import color
import gleam/io
import image.{star_polygon, stroke, to_svg}

pub fn main() {
  star_polygon(40.0, 7, 3, [stroke(color.darkred)])
  |> to_svg
  |> io.println
}
