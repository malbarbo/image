import fill
import gleam/io
import image.{combine, ellipse, to_svg, underlay}
import style

pub fn main() {
  [
    ellipse(10.0, 60.0, style.join([fill.red, fill.opacity(0.2)])),
    ellipse(20.0, 50.0, style.join([fill.red, fill.opacity(0.2)])),
    ellipse(30.0, 40.0, style.join([fill.red, fill.opacity(0.2)])),
    ellipse(40.0, 30.0, style.join([fill.red, fill.opacity(0.2)])),
    ellipse(50.0, 20.0, style.join([fill.red, fill.opacity(0.2)])),
    ellipse(60.0, 10.0, style.join([fill.red, fill.opacity(0.2)])),
  ]
  |> combine(underlay)
  |> to_svg
  |> io.println
}
