import gleam/io
import image.{rectangle, to_svg}
import stroke

pub fn main() {
  rectangle(40.0, 20.0, stroke.black)
  |> to_svg
  |> io.println
}
