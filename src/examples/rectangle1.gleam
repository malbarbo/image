import color
import gleam/io
import image.{outline, rectangle, to_svg}

pub fn main() {
  rectangle(40.0, 20.0, [outline(color.black)])
  |> to_svg
  |> io.println
}
