import fill
import gleam/io
import image.{star_polygon, to_svg}

pub fn main() {
  star_polygon(40.0, 5, 2, fill.seagreen)
  |> to_svg
  |> io.println
}
