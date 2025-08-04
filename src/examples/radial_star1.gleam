import fill
import gleam/io
import image.{radial_start, to_svg}

pub fn main() {
  radial_start(8, 8.0, 64.0, fill.darkslategray)
  |> to_svg
  |> io.println
}
