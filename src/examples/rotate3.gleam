import fill
import gleam/io
import image.{beside, rectangle, rotate, to_svg}

pub fn main() {
  rectangle(40.0, 20.0, fill.darkseagreen)
  |> beside(rectangle(20.0, 100.0, fill.darkseagreen))
  |> rotate(45.0)
  |> to_svg
  |> io.println
}
