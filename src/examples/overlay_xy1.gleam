import color
import gleam/io
import image.{outline, overlay_xy, rectangle, to_svg}

pub fn main() {
  rectangle(20.0, 20.0, [outline(color.black)])
  |> overlay_xy(20.0, 0.0, rectangle(20.0, 20.0, [outline(color.black)]))
  |> to_svg
  |> io.println
}
