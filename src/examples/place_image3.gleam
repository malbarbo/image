import fill
import gleam/io
import image.{circle, place_image, rectangle, to_svg}

pub fn main() {
  rectangle(24.0, 24.0, fill.goldenrod)
  |> place_image(8.0, 14.0, circle(4.0, fill.white))
  |> place_image(14.0, 2.0, circle(4.0, fill.white))
  |> place_image(0.0, 6.0, circle(4.0, fill.white))
  |> place_image(18.0, 20.0, circle(4.0, fill.white))
  |> to_svg
  |> io.println
}
