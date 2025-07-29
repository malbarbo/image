import color
import gleam/io
import image.{Top, beside_align, ellipse, fill, to_svg}

pub fn main() {
  ellipse(20.0, 70.0, [fill(color.mediumorchid)])
  |> beside_align(Top, _, ellipse(20.0, 50.0, [fill(color.darkorchid)]))
  |> beside_align(Top, _, ellipse(20.0, 30.0, [fill(color.purple)]))
  |> beside_align(Top, _, ellipse(20.0, 10.0, [fill(color.indigo)]))
  |> to_svg
  |> io.println
}
