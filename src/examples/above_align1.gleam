import color
import gleam/io
import image.{Right, above_align, ellipse, fill, to_svg}

pub fn main() {
  ellipse(70.0, 20.0, [fill(color.yellowgreen)])
  |> above_align(Right, _, ellipse(50.0, 20.0, [fill(color.olivedrab)]))
  |> above_align(Right, _, ellipse(30.0, 20.0, [fill(color.darkolivegreen)]))
  |> above_align(Right, _, ellipse(10.0, 20.0, [fill(color.darkgreen)]))
  |> to_svg
  |> io.println
}
