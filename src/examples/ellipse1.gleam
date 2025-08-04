import gleam/io
import image.{ellipse, to_svg}
import stroke

pub fn main() {
  ellipse(60.0, 30.0, stroke.black)
  |> to_svg
  |> io.println
}
