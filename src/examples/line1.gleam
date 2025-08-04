import gleam/io
import image.{line, to_svg}
import stroke

pub fn main() {
  line(30.0, 30.0, stroke.black)
  |> to_svg
  |> io.println
}
