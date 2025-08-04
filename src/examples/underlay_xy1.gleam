import gleam/io
import image.{rectangle, to_svg, underlay_xy}
import stroke

pub fn main() {
  rectangle(20.0, 20.0, stroke.black)
  |> underlay_xy(20.0, 0.0, rectangle(20.0, 20.0, stroke.black))
  |> to_svg
  |> io.println
}
