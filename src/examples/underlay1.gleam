import color
import gleam/io
import image.{ellipse, fill, rectangle, to_svg, underlay}

pub fn main() {
  rectangle(30.0, 60.0, [fill(color.orange)])
  |> underlay(ellipse(60.0, 30.0, [fill(color.purple)]))
  |> to_svg
  |> io.println
}
