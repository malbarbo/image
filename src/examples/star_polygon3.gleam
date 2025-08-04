import fill
import gleam/io
import image.{star_polygon, to_svg}

pub fn main() {
  star_polygon(20.0, 10, 3, fill.cornflowerblue)
  |> to_svg
  |> io.println
}
