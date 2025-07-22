import color
import gleam/io
import image.{line, outline, to_svg}

pub fn main() {
  line(-30.0, 20.0, [outline(color.red)])
  |> to_svg
  |> io.println
}
