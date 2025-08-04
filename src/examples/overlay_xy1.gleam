import color
import gleam/io
import image.{overlay_xy, rectangle, stroke, to_svg}

pub fn main() {
  rectangle(20.0, 20.0, [stroke(color.black)])
  |> overlay_xy(20.0, 0.0, rectangle(20.0, 20.0, [stroke(color.black)]))
  |> to_svg
  |> io.println
}
