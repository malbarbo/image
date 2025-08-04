import color
import gleam/io
import image.{radial_start, stroke, to_svg}

pub fn main() {
  radial_start(32, 30.0, 40.0, [stroke(color.black)])
  |> to_svg
  |> io.println
}
