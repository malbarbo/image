import color
import gleam/io
import image.{circle, fill, to_svg, underlay_offset}

pub fn main() {
  circle(40.0, [fill(color.gray)])
  |> underlay_offset(
    0.0,
    -10.0,
    circle(10.0, [fill(color.navy)])
      |> underlay_offset(-30.0, 0.0, circle(10.0, [fill(color.navy)])),
  )
  |> to_svg
  |> io.println
}
