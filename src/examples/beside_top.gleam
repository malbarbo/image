import color
import gleam/io
import image.{beside_top, ellipse, fill, to_svg}

pub fn main() {
  ellipse(20.0, 70.0, [fill(color.lightsteelblue)])
  |> beside_top(ellipse(20.0, 50.0, [fill(color.mediumslateblue)]))
  |> beside_top(ellipse(20.0, 30.0, [fill(color.slateblue)]))
  |> beside_top(ellipse(20.0, 10.0, [fill(color.navy)]))
  |> to_svg
  |> io.println
}
