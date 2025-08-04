import fill
import gleam/io
import image.{ellipse, overlay, to_svg}

pub fn main() {
  ellipse(10.0, 10.0, fill.red)
  |> overlay(ellipse(20.0, 20.0, fill.black))
  |> overlay(ellipse(30.0, 30.0, fill.red))
  |> overlay(ellipse(40.0, 40.0, fill.black))
  |> overlay(ellipse(50.0, 50.0, fill.red))
  |> overlay(ellipse(60.0, 60.0, fill.black))
  |> to_svg
  |> io.println
}
