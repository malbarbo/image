import fill
import gleam/io
import image.{Right, Top, square, to_svg, underlay_align}

pub fn main() {
  square(50.0, fill.seagreen)
  |> underlay_align(Right, Top, _, square(40.0, fill.silver))
  |> underlay_align(Right, Top, _, square(30.0, fill.seagreen))
  |> underlay_align(Right, Top, _, square(20.0, fill.silver))
  |> to_svg
  |> io.println
}
