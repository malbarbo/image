import fill
import gleam/io
import image.{to_svg, triangle}

pub fn main() {
  triangle(40.0, fill.tan)
  |> to_svg
  |> io.println
}
