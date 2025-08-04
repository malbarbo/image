import color
import gleam/io
import image.{add_line, ellipse, stroke, to_svg}

pub fn main() {
  ellipse(40.0, 40.0, [stroke(color.maroon)])
  |> add_line(0.0, 40.0, 40.0, 0.0, [stroke(color.maroon)])
  |> to_svg
  |> io.println
}
