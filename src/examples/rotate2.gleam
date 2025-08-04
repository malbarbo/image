import gleam/io
import image.{rectangle, rotate, to_svg}
import stroke

pub fn main() {
  rectangle(50.0, 50.0, stroke.black)
  |> rotate(5.0)
  |> to_svg
  |> io.println
}
