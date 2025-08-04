import fill
import gleam/io
import image.{ellipse, rectangle, to_svg, underlay}

pub fn main() {
  rectangle(30.0, 60.0, fill.orange)
  |> underlay(ellipse(60.0, 30.0, fill.purple))
  |> to_svg
  |> io.println
}
