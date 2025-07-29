import color
import gleam/io
import image.{fill, outline, place_line, rectangle, to_svg}

pub fn main() {
  rectangle(40.0, 40.0, [fill(color.lightgray)])
  |> place_line(-10.0, 50.0, 50.0, -10.0, [outline(color.maroon)])
  |> to_svg
  |> io.println
}
