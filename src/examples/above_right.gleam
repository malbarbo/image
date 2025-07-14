import color
import gleam/io
import image.{above_right, ellipse, fill, to_svg}

pub fn main() {
  ellipse(70.0, 20.0, [fill(color.gold)])
  |> above_right(ellipse(50.0, 20.0, [fill(color.goldenrod)]))
  |> above_right(ellipse(30.0, 20.0, [fill(color.darkgoldenrod)]))
  |> above_right(ellipse(10.0, 20.0, [fill(color.sienna)]))
  |> to_svg
  |> io.println
}
