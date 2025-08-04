import fill
import gleam/io
import image.{Bottom, beside_align, ellipse, to_svg}

pub fn main() {
  ellipse(20.0, 70.0, fill.lightsteelblue)
  |> beside_align(Bottom, _, ellipse(20.0, 50.0, fill.mediumslateblue))
  |> beside_align(Bottom, _, ellipse(20.0, 30.0, fill.slateblue))
  |> beside_align(Bottom, _, ellipse(20.0, 10.0, fill.navy))
  |> to_svg
  |> io.println
}
