import color
import gleam/io
import image.{ellipse, fill, rotate, to_svg}

pub fn main() {
  ellipse(60.0, 20.0, [fill(color.olivedrab)])
  |> rotate(45.0)
  |> to_svg
  |> io.println
}
