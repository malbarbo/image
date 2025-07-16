import color
import gleam/io
import image.{ellipse, outline, to_svg}

pub fn main() {
  ellipse(60.0, 30.0, [outline(color.black)])
  |> to_svg
  |> io.println
}
