import fill
import gleam/io
import image.{rectangle, to_svg, underlay_xy}

pub fn main() {
  rectangle(20.0, 20.0, fill.red)
  |> underlay_xy(-10.0, -10.0, rectangle(20.0, 20.0, fill.black))
  |> to_svg
  |> io.println
}
