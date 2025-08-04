import gleam/io
import image.{radial_start, to_svg}
import stroke

pub fn main() {
  radial_start(32, 30.0, 40.0, stroke.black)
  |> to_svg
  |> io.println
}
