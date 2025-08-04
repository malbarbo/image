import fill
import gleam/io
import image.{Bottom, Right, overlay_align, square, to_svg}

pub fn main() {
  square(20.0, fill.silver)
  |> overlay_align(Right, Bottom, _, square(30.0, fill.seagreen))
  |> overlay_align(Right, Bottom, _, square(40.0, fill.silver))
  |> overlay_align(Right, Bottom, _, square(50.0, fill.seagreen))
  |> to_svg
  |> io.println
}
