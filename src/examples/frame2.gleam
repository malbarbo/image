import fill
import gleam/io
import image.{beside, ellipse, frame, to_svg}

pub fn main() {
  ellipse(20.0, 70.0, fill.lightsteelblue)
  |> beside(ellipse(20.0, 50.0, fill.mediumslateblue) |> frame)
  |> beside(ellipse(20.0, 30.0, fill.slateblue))
  |> beside(ellipse(20.0, 10.0, fill.navy))
  |> to_svg
  |> io.println
}
