import fill
import gleam/io
import image.{ellipse, overlay, rectangle, to_svg}

pub fn main() {
  rectangle(30.0, 60.0, fill.orange)
  |> overlay(ellipse(60.0, 30.0, fill.purple))
  |> to_svg
  |> io.println
}
