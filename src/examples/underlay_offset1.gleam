import color
import gleam/io
import image.{circle, fill, to_svg, underlay_offset}

pub fn main() {
  circle(40.0, [fill(color.red)])
  |> underlay_offset(10.0, 10.0, circle(40.0, [fill(color.blue)]))
  |> to_svg
  |> io.println
}
