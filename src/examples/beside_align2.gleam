import fill
import gleam/io
import image.{Top, beside_align, ellipse, to_svg}

pub fn main() {
  ellipse(20.0, 70.0, fill.mediumorchid)
  |> beside_align(Top, _, ellipse(20.0, 50.0, fill.darkorchid))
  |> beside_align(Top, _, ellipse(20.0, 30.0, fill.purple))
  |> beside_align(Top, _, ellipse(20.0, 10.0, fill.indigo))
  |> to_svg
  |> io.println
}
