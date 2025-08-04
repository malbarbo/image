import fill
import gleam/io
import image.{add_line, rectangle, to_svg}
import stroke
import style

pub fn main() {
  rectangle(100.0, 100.0, fill.darkolivegreen)
  |> add_line(
    25.0,
    25.0,
    75.0,
    75.0,
    style.join([
      stroke.goldenrod,
      stroke.width(30.0),
      stroke.linejoin_round,
      stroke.linecap_round,
    ]),
  )
  |> to_svg
  |> io.println
}
