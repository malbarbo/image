import fill
import gleam/io
import image.{ellipse, overlay_xy, to_svg}
import stroke

pub fn main() {
  ellipse(40.0, 40.0, stroke.black)
  |> overlay_xy(10.0, 15.0, ellipse(10.0, 10.0, fill.forestgreen))
  |> overlay_xy(20.0, 15.0, ellipse(10.0, 10.0, fill.forestgreen))
  |> to_svg
  |> io.println
}
