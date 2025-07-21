import color
import gleam/io
import image.{beside, ellipse, fill, frame, to_svg}

pub fn main() {
  ellipse(20.0, 70.0, [fill(color.lightsteelblue)])
  |> beside(ellipse(20.0, 50.0, [fill(color.mediumslateblue)]) |> frame)
  |> beside(ellipse(20.0, 30.0, [fill(color.slateblue)]))
  |> beside(ellipse(20.0, 10.0, [fill(color.navy)]))
  |> to_svg
  |> io.println
}
