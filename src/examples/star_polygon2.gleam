import gleam/io
import image.{star_polygon, to_svg}
import stroke

pub fn main() {
  star_polygon(40.0, 7, 3, stroke.darkred)
  |> to_svg
  |> io.println
}
