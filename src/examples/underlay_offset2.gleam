import fill
import gleam/io
import image.{circle, to_svg, underlay_offset}

pub fn main() {
  circle(40.0, fill.gray)
  |> underlay_offset(
    0.0,
    -10.0,
    circle(10.0, fill.navy)
      |> underlay_offset(-30.0, 0.0, circle(10.0, fill.navy)),
  )
  |> to_svg
  |> io.println
}
