import color
import gleam/io
import image.{Bottom, Right, fill, overlay_align, square, to_svg}

pub fn main() {
  square(20.0, [fill(color.silver)])
  |> overlay_align(Right, Bottom, _, square(30.0, [fill(color.seagreen)]))
  |> overlay_align(Right, Bottom, _, square(40.0, [fill(color.silver)]))
  |> overlay_align(Right, Bottom, _, square(50.0, [fill(color.seagreen)]))
  |> to_svg
  |> io.println
}
