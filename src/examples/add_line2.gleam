import fill
import gleam/io
import image.{add_line, rectangle, to_svg}
import stroke

pub fn main() {
  rectangle(40.0, 40.0, fill.gray)
  |> add_line(-10.0, 50.0, 50.0, -10.0, stroke.maroon)
  |> to_svg
  |> io.println
}
