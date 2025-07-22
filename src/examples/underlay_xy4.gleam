import color
import gleam/io
import image.{ellipse, fill, to_svg, underlay_xy}

pub fn main() {
  ellipse(40.0, 40.0, [fill(color.lightgray)])
  |> underlay_xy(10.0, 15.0, ellipse(10.0, 10.0, [fill(color.forestgreen)]))
  |> underlay_xy(20.0, 15.0, ellipse(10.0, 10.0, [fill(color.forestgreen)]))
  |> to_svg
  |> io.println
}
