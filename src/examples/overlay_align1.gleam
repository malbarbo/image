import color
import gleam/io
import image.{Left, Middle, ellipse, fill, overlay_align, rectangle, to_svg}

pub fn main() {
  rectangle(30.0, 60.0, [fill(color.orange)])
  |> overlay_align(Left, Middle, _, ellipse(60.0, 30.0, [fill(color.purple)]))
  |> to_svg
  |> io.println
}
