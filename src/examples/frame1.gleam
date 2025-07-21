import color
import gleam/io
import image.{ellipse, fill, frame, to_svg}

pub fn main() {
  ellipse(40.0, 40.0, [fill(color.gray)])
  |> frame
  |> to_svg
  |> io.println
}
