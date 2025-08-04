import fill
import gleam/io
import image.{ellipse, to_svg, underlay_xy}

pub fn main() {
  ellipse(40.0, 40.0, fill.lightgray)
  |> underlay_xy(10.0, 15.0, ellipse(10.0, 10.0, fill.forestgreen))
  |> underlay_xy(20.0, 15.0, ellipse(10.0, 10.0, fill.forestgreen))
  |> to_svg
  |> io.println
}
