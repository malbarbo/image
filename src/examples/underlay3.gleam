import color
import gleam/io
import image.{combine, ellipse, fill, fill_opacity, to_svg, underlay}

pub fn main() {
  [
    ellipse(10.0, 60.0, [fill(color.red), fill_opacity(0.2)]),
    ellipse(20.0, 50.0, [fill(color.red), fill_opacity(0.2)]),
    ellipse(30.0, 40.0, [fill(color.red), fill_opacity(0.2)]),
    ellipse(40.0, 30.0, [fill(color.red), fill_opacity(0.2)]),
    ellipse(50.0, 20.0, [fill(color.red), fill_opacity(0.2)]),
    ellipse(60.0, 10.0, [fill(color.red), fill_opacity(0.2)]),
  ]
  |> combine(underlay)
  |> to_svg
  |> io.println
}
