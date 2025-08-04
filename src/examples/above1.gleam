import fill
import gleam/io
import image.{above, ellipse, to_svg}

pub fn main() {
  ellipse(70.0, 20.0, fill.lightgray)
  |> above(ellipse(50.0, 20.0, fill.darkgray))
  |> above(ellipse(30.0, 20.0, fill.dimgray))
  |> above(ellipse(10.0, 20.0, fill.black))
  |> to_svg
  |> io.println
}
