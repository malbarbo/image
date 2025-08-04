import fill
import gleam/io
import image.{rectangle, to_svg}

pub fn main() {
  rectangle(20.0, 40.0, fill.black)
  |> to_svg
  |> io.println
}
