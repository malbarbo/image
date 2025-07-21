import color
import gleam/io
import image.{fill, rhombus, to_svg}

pub fn main() {
  rhombus(40.0, 45.0, [fill(color.magenta)])
  |> to_svg
  |> io.println
}
