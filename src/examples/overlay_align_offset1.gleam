import color
import gleam/io
import image.{
  Bottom, Right, circle, fill, overlay_align_offset, star_polygon, to_svg,
}

pub fn main() {
  overlay_align_offset(
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
