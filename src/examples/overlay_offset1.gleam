import color
import gleam/io
import image.{circle, fill, overlay_offset, to_svg}

pub fn main() {
  circle(40.0, [fill(color.red)])
  |> overlay_offset(10.0, 10.0, circle(40.0, [fill(color.blue)]))
  |> to_svg
  |> io.println
}
