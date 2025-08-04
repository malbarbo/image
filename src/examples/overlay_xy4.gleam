import color
import gleam/io
import image.{ellipse, fill, overlay_xy, stroke, to_svg}

pub fn main() {
  ellipse(40.0, 40.0, [stroke(color.black)])
  |> overlay_xy(10.0, 15.0, ellipse(10.0, 10.0, [fill(color.forestgreen)]))
  |> overlay_xy(20.0, 15.0, ellipse(10.0, 10.0, [fill(color.forestgreen)]))
  |> to_svg
  |> io.println
}
