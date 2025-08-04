import fill
import gleam/io
import image.{square, to_svg}

pub fn main() {
  square(40.0, fill.slateblue)
  |> to_svg
  |> io.println
}
