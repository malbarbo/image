import color
import gleam/io
import image.{outline, rectangle, to_svg, underlay_xy}

pub fn main() {
  rectangle(20.0, 20.0, [outline(color.black)])
  |> underlay_xy(20.0, 0.0, rectangle(20.0, 20.0, [outline(color.black)]))
  |> to_svg
  |> io.println
}
