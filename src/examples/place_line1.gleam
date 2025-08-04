import color
import gleam/io
import image.{ellipse, place_line, stroke, to_svg}

pub fn main() {
  ellipse(40.0, 40.0, [stroke(color.maroon)])
  |> place_line(0.0, 40.0, 40.0, 0.0, [stroke(color.maroon)])
  |> to_svg
  |> io.println
}
