import color
import gleam/io
import image.{
  Point, fill, polygon, rectangle, stroke, stroke_linecap_square,
  stroke_linejoin_miter, stroke_width, to_svg, underlay,
}

pub fn main() {
  rectangle(80.0, 80.0, [fill(color.mediumseagreen)])
  |> underlay(
    polygon(
      [Point(0.0, 0.0), Point(50.0, 0.0), Point(0.0, 50.0), Point(50.0, 50.0)],
      [
        stroke(color.darkslategray),
        stroke_width(10.0),
        stroke_linecap_square,
        stroke_linejoin_miter,
      ],
    ),
  )
  |> to_svg
  |> io.println
}
