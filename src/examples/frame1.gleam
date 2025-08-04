import fill
import gleam/io
import image.{ellipse, frame, to_svg}

pub fn main() {
  ellipse(40.0, 40.0, fill.gray)
  |> frame
  |> to_svg
  |> io.println
}
