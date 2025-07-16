import color
import gleam/io
import image.{outline, regular_polygon, to_svg}

pub fn main() {
  regular_polygon(50.0, 3, [outline(color.red)])
  |> to_svg
  |> io.println
}
