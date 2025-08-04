import gleam/io
import image.{ellipse, place_line, to_svg}
import stroke

pub fn main() {
  ellipse(40.0, 40.0, stroke.maroon)
  |> place_line(0.0, 40.0, 40.0, 0.0, stroke.maroon)
  |> to_svg
  |> io.println
}
