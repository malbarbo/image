import fill
import gleam/io
import image.{Right, above_align, ellipse, to_svg}

pub fn main() {
  ellipse(70.0, 20.0, fill.yellowgreen)
  |> above_align(Right, _, ellipse(50.0, 20.0, fill.olivedrab))
  |> above_align(Right, _, ellipse(30.0, 20.0, fill.darkolivegreen))
  |> above_align(Right, _, ellipse(10.0, 20.0, fill.darkgreen))
  |> to_svg
  |> io.println
}
