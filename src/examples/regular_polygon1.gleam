import gleam/io
import image.{regular_polygon, to_svg}
import stroke

pub fn main() {
  regular_polygon(50.0, 3, stroke.red)
  |> to_svg
  |> io.println
}
