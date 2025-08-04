import fill
import gleam/io
import image.{ellipse, rotate, to_svg}

pub fn main() {
  ellipse(60.0, 20.0, fill.olivedrab)
  |> rotate(45.0)
  |> to_svg
  |> io.println
}
