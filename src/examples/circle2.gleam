import fill
import gleam/io
import image.{circle, to_svg}

pub fn main() {
  circle(20.0, fill.blue)
  |> to_svg
  |> io.println
}
