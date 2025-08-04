import color
import gleam/io
import image.{Point, fill, place_polygon, square, stroke, to_svg}

pub fn main() {
  square(180.0, [fill(color.yellow)])
  |> place_polygon(
    [
      Point(109.0, 160.0),
      Point(26.0, 148.0),
      Point(46.0, 36.0),
      Point(93.0, 44.0),
      Point(89.0, 68.0),
      Point(122.0, 72.0),
    ],
    [stroke(color.darkblue)],
  )
  |> to_svg
  |> io.println
}
