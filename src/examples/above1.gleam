import color
import gleam/io
import image.{above, ellipse, fill, to_svg}

pub fn main() {
  ellipse(70.0, 20.0, [fill(color.lightgray)])
  |> above(ellipse(50.0, 20.0, [fill(color.darkgray)]))
  |> above(ellipse(30.0, 20.0, [fill(color.dimgray)]))
  |> above(ellipse(10.0, 20.0, [fill(color.black)]))
  |> to_svg
  |> io.println
}
