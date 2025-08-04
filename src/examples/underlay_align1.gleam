import fill
import gleam/io
import image.{Left, Middle, ellipse, rectangle, to_svg, underlay_align}

pub fn main() {
  rectangle(30.0, 60.0, fill.orange)
  |> underlay_align(Left, Middle, _, ellipse(60.0, 30.0, fill.purple))
  |> to_svg
  |> io.println
}
