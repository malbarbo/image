import fill
import gleam/io
import image.{Bottom, Right, circle, overlay_align_offset, star_polygon, to_svg}

pub fn main() {
  overlay_align_offset(
    Right,
    Bottom,
    star_polygon(20.0, 20, 3, fill.navy),
    10.0,
    10.0,
    circle(30.0, fill.cornflowerblue),
  )
  |> to_svg
  |> io.println
}
