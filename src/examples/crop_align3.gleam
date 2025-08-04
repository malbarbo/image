import fill
import gleam/io
import image.{Center, Middle, circle, crop_align, to_svg}

pub fn main() {
  circle(25.0, fill.mediumslateblue)
  |> crop_align(Center, Middle, 50.0, 30.0)
  |> to_svg
  |> io.println
}
