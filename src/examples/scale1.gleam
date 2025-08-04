import fill
import gleam/io
import image.{beside, ellipse, scale, to_svg}

pub fn main() {
  ellipse(20.0, 30.0, fill.blue)
  |> scale(2.0)
  |> beside(ellipse(40.0, 60.0, fill.blue))
  |> to_svg
  |> io.println
}
