import fill
import gleam/io
import image.{circle, overlay_offset, rectangle, to_svg}

pub fn main() {
  rectangle(60.0, 20.0, fill.black)
  |> overlay_offset(-50.0, 0.0, circle(20.0, fill.darkorange))
  |> overlay_offset(70.0, 0.0, circle(20.0, fill.darkorange))
  |> to_svg
  |> io.println
}
