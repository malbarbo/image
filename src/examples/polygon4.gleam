import color
import gleam/io
import image.{
  Point, fill, outline, polygon, rectangle, stroke_linecap_round,
  stroke_linejoin_round, stroke_width, to_svg, underlay,
}

pub fn main() {
  rectangle(80.0, 80.0, [fill(color.mediumseagreen)])
  |> underlay(
    polygon(
      [Point(0.0, 0.0), Point(50.0, 0.0), Point(0.0, 50.0), Point(50.0, 50.0)],
      [
        outline(color.darkslategray),
        stroke_width(10.0),
        stroke_linecap_round,
        stroke_linejoin_round,
      ],
    ),
  )
  |> to_svg
  |> io.println
}
