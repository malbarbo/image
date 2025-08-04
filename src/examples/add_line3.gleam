import color
import gleam/io
import image.{
  add_line, fill, rectangle, stroke, stroke_linecap_round, stroke_linejoin_round,
  stroke_width, to_svg,
}

pub fn main() {
  rectangle(100.0, 100.0, [fill(color.darkolivegreen)])
  |> add_line(25.0, 25.0, 75.0, 75.0, [
    stroke(color.goldenrod),
    stroke_width(30.0),
    stroke_linejoin_round,
    stroke_linecap_round,
  ])
  |> to_svg
  |> io.println
}
