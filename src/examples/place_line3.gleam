import color
import gleam/io
import image.{
  fill, outline, place_line, rectangle, stroke_linecap_round,
  stroke_linejoin_round, stroke_width, to_svg,
}

pub fn main() {
  rectangle(100.0, 100.0, [fill(color.darkolivegreen)])
  |> place_line(25.0, 25.0, 100.0, 100.0, [
    outline(color.goldenrod),
    stroke_width(30.0),
    stroke_linejoin_round,
    stroke_linecap_round,
  ])
  |> to_svg
  |> io.println
}
