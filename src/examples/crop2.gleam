import fill
import gleam/io
import image.{crop, ellipse, to_svg}

pub fn main() {
  ellipse(80.0, 120.0, fill.dodgerblue)
  |> crop(40.0, 60.0, 40.0, 60.0)
  |> to_svg
  |> io.println
}
