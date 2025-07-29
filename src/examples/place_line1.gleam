import color
import gleam/io
import image.{ellipse, outline, place_line, to_svg}

pub fn main() {
  ellipse(40.0, 40.0, [outline(color.maroon)])
  |> place_line(0.0, 40.0, 40.0, 0.0, [outline(color.maroon)])
  |> to_svg
  |> io.println
}
