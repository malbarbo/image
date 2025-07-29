import color
import gleam/io
import image.{Left, Middle, fill, fill_opacity, square, to_svg, underlay_align}

pub fn main() {
  square(50.0, [fill(color.seagreen), fill_opacity(0.25)])
  |> underlay_align(
    Left,
    Middle,
    _,
    square(40.0, [fill(color.seagreen), fill_opacity(0.25)]),
  )
  |> underlay_align(
    Left,
    Middle,
    _,
    square(30.0, [fill(color.seagreen), fill_opacity(0.25)]),
  )
  |> underlay_align(
    Left,
    Middle,
    _,
    square(20.0, [fill(color.seagreen), fill_opacity(0.25)]),
  )
  |> to_svg
  |> io.println
}
