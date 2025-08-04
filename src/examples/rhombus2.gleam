import fill
import gleam/io
import image.{rhombus, to_svg}

pub fn main() {
  rhombus(80.0, 150.0, fill.mediumpurple)
  |> to_svg
  |> io.println
}
