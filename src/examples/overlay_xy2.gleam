import color
import gleam/io
import image.{fill, overlay_xy, rectangle, to_svg}

pub fn main() {
  rectangle(20.0, 20.0, [fill(color.red)])
  |> overlay_xy(10.0, 10.0, rectangle(20.0, 20.0, [fill(color.black)]))
  |> to_svg
  |> io.println
}
