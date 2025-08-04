import fill
import gleam/io
import image.{Point, polygon, rectangle, to_svg, underlay}
import stroke
import style

pub fn main() {
  rectangle(80.0, 80.0, fill.mediumseagreen)
  |> underlay(polygon(
    [Point(0.0, 0.0), Point(50.0, 0.0), Point(0.0, 50.0), Point(50.0, 50.0)],
    style.join([
      stroke.darkslategray,
      stroke.width(10.0),
      stroke.linecap_round,
      stroke.linejoin_round,
    ]),
  ))
  |> to_svg
  |> io.println
}
