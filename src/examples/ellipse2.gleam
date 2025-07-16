import color
import gleam/io
import image.{ellipse, fill, to_svg}

pub fn main() {
  ellipse(30.0, 60.0, [fill(color.blue)])
  |> to_svg
  |> io.println
}
