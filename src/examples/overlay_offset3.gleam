import color
import gleam/io
import image.{circle, fill, overlay_offset, to_svg}

pub fn main() {
  circle(30.0, [fill(color.rgba(0, 150, 0, 0.5))])
  |> overlay_offset(26.0, 0.0, circle(30.0, [fill(color.rgba(0, 0, 255, 0.5))]))
  |> overlay_offset(0.0, 26.0, circle(30.0, [fill(color.rgba(200, 0, 0, 0.5))]))
  |> to_svg
  |> io.println
}
