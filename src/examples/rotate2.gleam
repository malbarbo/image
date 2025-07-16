import color
import gleam/io
import image.{outline, rectangle, rotate, to_svg}

pub fn main() {
  rectangle(50.0, 50.0, [outline(color.black)])
  |> rotate(5.0)
  |> to_svg
  |> io.println
}
