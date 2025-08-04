import fill
import gleam/io
import image.{circle, to_svg, underlay_offset}

pub fn main() {
  circle(40.0, fill.red)
  |> underlay_offset(10.0, 10.0, circle(40.0, fill.blue))
  |> to_svg
  |> io.println
}
