import color
import gleam/io
import image.{outline, radial_start, to_svg}

pub fn main() {
  radial_start(32, 30.0, 40.0, [outline(color.black)])
  |> to_svg
  |> io.println
}
