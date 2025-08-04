import fill
import gleam/io
import image.{
  Center, Middle, beside, circle, combine, place_image_align, rectangle, to_svg,
}
import stroke

pub fn main() {
  [
    rectangle(32.0, 32.0, stroke.black)
      |> place_image_align(0.0, 0.0, Center, Middle, circle(8.0, fill.tomato)),
    rectangle(32.0, 32.0, stroke.black)
      |> place_image_align(8.0, 8.0, Center, Middle, circle(8.0, fill.tomato)),
    rectangle(32.0, 32.0, stroke.black)
      |> place_image_align(16.0, 16.0, Center, Middle, circle(8.0, fill.tomato)),
    rectangle(32.0, 32.0, stroke.black)
      |> place_image_align(24.0, 24.0, Center, Middle, circle(8.0, fill.tomato)),
    rectangle(32.0, 32.0, stroke.black)
      |> place_image_align(32.0, 32.0, Center, Middle, circle(8.0, fill.tomato)),
  ]
  |> combine(beside)
  |> to_svg
  |> io.println
}
