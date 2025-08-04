import fill
import gleam/io
import image.{overlay_xy, rectangle, to_svg}

pub fn main() {
  rectangle(20.0, 20.0, fill.red)
  |> overlay_xy(-10.0, -10.0, rectangle(20.0, 20.0, fill.black))
  |> to_svg
  |> io.println
}
