import color
import gleam/io
import image.{
  Bottom, Right, circle, fill, star_polygon, to_svg, underlay_align_offset,
}

pub fn main() {
  underlay_align_offset(
    Right,
    Bottom,
    star_polygon(20.0, 20, 3, [fill(color.navy)]),
    10.0,
    10.0,
    circle(30.0, [fill(color.cornflowerblue)]),
  )
  |> to_svg
  |> io.println
}
