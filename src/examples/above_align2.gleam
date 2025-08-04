import fill
import gleam/io
import image.{Left, above_align, ellipse, to_svg}

pub fn main() {
  ellipse(70.0, 20.0, fill.gold)
  |> above_align(Left, _, ellipse(50.0, 20.0, fill.goldenrod))
  |> above_align(Left, _, ellipse(30.0, 20.0, fill.darkgoldenrod))
  |> above_align(Left, _, ellipse(10.0, 20.0, fill.sienna))
  |> to_svg
  |> io.println
}
