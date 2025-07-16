import color
import gleam/io
import image.{ellipse, fill, overlay, rectangle, to_svg}

pub fn main() {
  rectangle(30.0, 60.0, [fill(color.orange)])
  |> overlay(ellipse(60.0, 30.0, [fill(color.purple)]))
  |> to_svg
  |> io.println
}
