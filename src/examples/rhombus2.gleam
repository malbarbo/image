import color
import gleam/io
import image.{fill, rhombus, to_svg}

pub fn main() {
  rhombus(80.0, 150.0, [fill(color.mediumpurple)])
  |> to_svg
  |> io.println
}
