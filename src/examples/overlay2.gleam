import color
import gleam/io
import image.{ellipse, fill, overlay, to_svg}

pub fn main() {
  ellipse(10.0, 10.0, [fill(color.red)])
  |> overlay(ellipse(20.0, 20.0, [fill(color.black)]))
  |> overlay(ellipse(30.0, 30.0, [fill(color.red)]))
  |> overlay(ellipse(40.0, 40.0, [fill(color.black)]))
  |> overlay(ellipse(50.0, 50.0, [fill(color.red)]))
  |> overlay(ellipse(60.0, 60.0, [fill(color.black)]))
  |> to_svg
  |> io.println
}
