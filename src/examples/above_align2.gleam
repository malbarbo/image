import color
import gleam/io
import image.{Left, above_align, ellipse, fill, to_svg}

pub fn main() {
  ellipse(70.0, 20.0, [fill(color.gold)])
  |> above_align(Left, _, ellipse(50.0, 20.0, [fill(color.goldenrod)]))
  |> above_align(Left, _, ellipse(30.0, 20.0, [fill(color.darkgoldenrod)]))
  |> above_align(Left, _, ellipse(10.0, 20.0, [fill(color.sienna)]))
  |> to_svg
  |> io.println
}
