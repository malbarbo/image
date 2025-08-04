import gleam/io
import image.{add_line, ellipse, to_svg}
import stroke

pub fn main() {
  ellipse(40.0, 40.0, stroke.maroon)
  |> add_line(0.0, 40.0, 40.0, 0.0, stroke.maroon)
  |> to_svg
  |> io.println
}
