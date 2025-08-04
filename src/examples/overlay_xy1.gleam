import gleam/io
import image.{overlay_xy, rectangle, to_svg}
import stroke

pub fn main() {
  rectangle(20.0, 20.0, stroke.black)
  |> overlay_xy(20.0, 0.0, rectangle(20.0, 20.0, stroke.black))
  |> to_svg
  |> io.println
}
