import fill
import gleam/io
import image.{
  Bottom, Left, Right, Top, above, beside, circle, crop_align, to_svg,
}

pub fn main() {
  above(
    beside(
      circle(40.0, fill.palevioletred)
        |> crop_align(Right, Bottom, 40.0, 40.0),
      circle(40.0, fill.lightcoral)
        |> crop_align(Left, Bottom, 40.0, 40.0),
    ),
    beside(
      circle(40.0, fill.lightcoral)
        |> crop_align(Right, Top, 40.0, 40.0),
      circle(40.0, fill.palevioletred)
        |> crop_align(Left, Top, 40.0, 40.0),
    ),
  )
  |> to_svg
  |> io.println
}
