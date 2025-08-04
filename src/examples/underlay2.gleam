import fill
import gleam/io
import image.{combine, ellipse, to_svg, underlay}

pub fn main() {
  [
    ellipse(10.0, 60.0, fill.red),
    ellipse(20.0, 50.0, fill.black),
    ellipse(30.0, 40.0, fill.red),
    ellipse(40.0, 30.0, fill.black),
    ellipse(50.0, 20.0, fill.red),
    ellipse(60.0, 10.0, fill.black),
  ]
  |> combine(underlay)
  |> to_svg
  |> io.println
}
