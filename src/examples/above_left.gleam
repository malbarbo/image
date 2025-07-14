import color
import gleam/io
import image.{above_left, ellipse, fill, to_svg}

pub fn main() {
  ellipse(70.0, 20.0, [fill(color.yellowgreen)])
  |> above_left(ellipse(50.0, 20.0, [fill(color.olivedrab)]))
  |> above_left(ellipse(30.0, 20.0, [fill(color.darkolivegreen)]))
  |> above_left(ellipse(10.0, 20.0, [fill(color.darkgreen)]))
  |> to_svg
  |> io.println
}
