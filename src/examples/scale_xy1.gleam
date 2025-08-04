import fill
import gleam/io
import image.{beside, ellipse, scale_xy, to_svg}

pub fn main() {
  ellipse(20.0, 30.0, fill.blue)
  |> scale_xy(3.0, 2.0)
  |> beside(ellipse(60.0, 60.0, fill.blue))
  |> to_svg
  |> io.println
}
