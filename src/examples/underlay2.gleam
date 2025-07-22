import color
import gleam/io
import image.{combine, ellipse, fill, to_svg, underlay}

pub fn main() {
  [
    ellipse(10.0, 60.0, [fill(color.red)]),
    ellipse(20.0, 50.0, [fill(color.black)]),
    ellipse(30.0, 40.0, [fill(color.red)]),
    ellipse(40.0, 30.0, [fill(color.black)]),
    ellipse(50.0, 20.0, [fill(color.red)]),
    ellipse(60.0, 10.0, [fill(color.black)]),
  ]
  |> combine(underlay)
  |> to_svg
  |> io.println
}
