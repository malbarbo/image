import fill
import gleam/io
import image.{place_image, rectangle, to_svg, triangle}

pub fn main() {
  rectangle(48.0, 48.0, fill.lightgray)
  |> place_image(24.0, 24.0, triangle(32.0, fill.red))
  |> to_svg
  |> io.println
}
