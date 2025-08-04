import fill
import gleam/io
import image.{ellipse, to_svg}

pub fn main() {
  ellipse(30.0, 60.0, fill.blue)
  |> to_svg
  |> io.println
}
