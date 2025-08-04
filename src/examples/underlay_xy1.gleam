import color
import gleam/io
import image.{rectangle, stroke, to_svg, underlay_xy}

pub fn main() {
  rectangle(20.0, 20.0, [stroke(color.black)])
  |> underlay_xy(20.0, 0.0, rectangle(20.0, 20.0, [stroke(color.black)]))
  |> to_svg
  |> io.println
}
