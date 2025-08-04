import fill
import gleam/io
import image.{Left, Middle, square, to_svg, underlay_align}
import style

pub fn main() {
  square(50.0, style.join([fill.seagreen, fill.opacity(0.25)]))
  |> underlay_align(
    Left,
    Middle,
    _,
    square(40.0, style.join([fill.seagreen, fill.opacity(0.25)])),
  )
  |> underlay_align(
    Left,
    Middle,
    _,
    square(30.0, style.join([fill.seagreen, fill.opacity(0.25)])),
  )
  |> underlay_align(
    Left,
    Middle,
    _,
    square(20.0, style.join([fill.seagreen, fill.opacity(0.25)])),
  )
  |> to_svg
  |> io.println
}
