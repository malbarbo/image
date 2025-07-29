import color
import gleam/io
import image.{Bottom, beside_align, ellipse, fill, to_svg}

pub fn main() {
  ellipse(20.0, 70.0, [fill(color.lightsteelblue)])
  |> beside_align(Bottom, _, ellipse(20.0, 50.0, [fill(color.mediumslateblue)]))
  |> beside_align(Bottom, _, ellipse(20.0, 30.0, [fill(color.slateblue)]))
  |> beside_align(Bottom, _, ellipse(20.0, 10.0, [fill(color.navy)]))
  |> to_svg
  |> io.println
}
