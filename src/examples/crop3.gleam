import fill
import gleam/io
import image.{above, beside, circle, crop, rotate, to_svg}

pub fn main() {
  above(
    beside(
      circle(40.0, fill.palevioletred) |> crop(40.0, 40.0, 40.0, 40.0),
      circle(40.0, fill.lightcoral) |> crop(0.0, 40.0, 40.0, 40.0),
    ),
    beside(
      circle(40.0, fill.lightcoral) |> crop(40.0, 0.0, 40.0, 40.0),
      circle(40.0, fill.palevioletred) |> crop(0.0, 0.0, 40.0, 40.0),
    ),
  )
  |> rotate(30.0)
  |> to_svg
  |> io.println
}
