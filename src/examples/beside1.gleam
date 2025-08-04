import fill
import gleam/io
import image.{beside, ellipse, to_svg}

pub fn main() {
  ellipse(20.0, 70.0, fill.lightgray)
  |> beside(ellipse(20.0, 50.0, fill.darkgray))
  |> beside(ellipse(20.0, 30.0, fill.dimgray))
  |> beside(ellipse(20.0, 10.0, fill.black))
  |> to_svg
  |> io.println
}
