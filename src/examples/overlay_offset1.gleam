import fill
import gleam/io
import image.{circle, overlay_offset, to_svg}

pub fn main() {
  circle(40.0, fill.red)
  |> overlay_offset(10.0, 10.0, circle(40.0, fill.blue))
  |> to_svg
  |> io.println
}
