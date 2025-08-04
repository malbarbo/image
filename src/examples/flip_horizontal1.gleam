import fill
import gleam/io
import image.{beside, flip_horizontal, rotate, square, to_svg}

pub fn main() {
  square(50.0, fill.red)
  |> rotate(30.0)
  |> beside(square(50.0, fill.blue) |> rotate(30.0) |> flip_horizontal)
  |> to_svg
  |> io.println
}
