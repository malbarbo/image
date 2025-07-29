import color
import gleam/io
import image.{beside, ellipse, fill, to_svg}

pub fn main() {
  ellipse(20.0, 70.0, [fill(color.lightgray)])
  |> beside(ellipse(20.0, 50.0, [fill(color.darkgray)]))
  |> beside(ellipse(20.0, 30.0, [fill(color.dimgray)]))
  |> beside(ellipse(20.0, 10.0, [fill(color.black)]))
  |> to_svg
  |> io.println
}
