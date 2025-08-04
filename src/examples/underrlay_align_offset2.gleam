import fill
import gleam/io
import image.{
  Bottom, Left, Right, Top, rhombus, star_polygon, to_svg, underlay_align_offset,
}

pub fn main() {
  let star = star_polygon(20.0, 11, 3, fill.cornflowerblue)
  rhombus(120.0, 90.0, fill.navy)
  |> underlay_align_offset(Left, Top, _, 16.0, 16.0, star)
  |> underlay_align_offset(Right, Top, _, -16.0, 16.0, star)
  |> underlay_align_offset(Left, Bottom, _, 16.0, -16.0, star)
  |> underlay_align_offset(Right, Bottom, _, -16.0, -16.0, star)
  |> to_svg
  |> io.println
}
