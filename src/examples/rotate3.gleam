import color
import gleam/io
import image.{beside, fill, rectangle, rotate, to_svg}

pub fn main() {
  rectangle(40.0, 20.0, [fill(color.darkseagreen)])
  |> beside(rectangle(20.0, 100.0, [fill(color.darkseagreen)]))
  |> rotate(45.0)
  |> to_svg
  |> io.println
}
