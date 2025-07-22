import color
import gleam/io
import image.{fill, rectangle, to_svg, underlay_xy}

pub fn main() {
  rectangle(20.0, 20.0, [fill(color.red)])
  |> underlay_xy(10.0, 10.0, rectangle(20.0, 20.0, [fill(color.black)]))
  |> to_svg
  |> io.println
}
