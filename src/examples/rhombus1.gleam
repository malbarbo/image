import fill
import gleam/io
import image.{rhombus, to_svg}

pub fn main() {
  rhombus(40.0, 45.0, fill.magenta)
  |> to_svg
  |> io.println
}
