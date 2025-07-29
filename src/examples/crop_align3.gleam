import color
import gleam/io
import image.{Center, Middle, circle, crop_align, fill, to_svg}

pub fn main() {
  circle(25.0, [fill(color.mediumslateblue)])
  |> crop_align(Center, Middle, 50.0, 30.0)
  |> to_svg
  |> io.println
}
