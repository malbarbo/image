import color
import gleam/io
import image.{fill, place_image, rectangle, to_svg, triangle}

pub fn main() {
  rectangle(48.0, 48.0, [fill(color.lightgray)])
  |> place_image(24.0, 24.0, triangle(64.0, [fill(color.red)]))
  |> to_svg
  |> io.println
}
