import fill
import gleam/io
import image.{overlay, regular_polygon, to_svg}

pub fn main() {
  regular_polygon(20.0, 5, fill.rgb(50, 50, 255))
  |> overlay(regular_polygon(26.0, 5, fill.rgb(100, 100, 255)))
  |> overlay(regular_polygon(32.0, 5, fill.rgb(150, 150, 255)))
  |> overlay(regular_polygon(38.0, 5, fill.rgb(200, 200, 255)))
  |> overlay(regular_polygon(44.0, 5, fill.rgb(250, 250, 255)))
  |> to_svg
  |> io.println
}
