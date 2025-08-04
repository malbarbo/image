import gleam/io
import image.{circle, to_svg}
import stroke

pub fn main() {
  circle(30.0, stroke.red)
  |> to_svg
  |> io.println
}
