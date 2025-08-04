import gleam/io
import image.{line, to_svg}
import stroke

pub fn main() {
  line(30.0, -20.0, stroke.red)
  |> to_svg
  |> io.println
}
