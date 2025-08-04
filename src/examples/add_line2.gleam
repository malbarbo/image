import color
import gleam/io
import image.{add_line, fill, rectangle, stroke, to_svg}

pub fn main() {
  rectangle(40.0, 40.0, [fill(color.gray)])
  |> add_line(-10.0, 50.0, 50.0, -10.0, [stroke(color.maroon)])
  |> to_svg
  |> io.println
}
