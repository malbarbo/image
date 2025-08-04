import fill
import gleam/io
import image.{above, flip_vertical, scale_xy, star, to_svg}

pub fn main() {
  star(40.0, fill.firebrick)
  |> above(star(40.0, fill.gray) |> flip_vertical |> scale_xy(1.0, 0.5))
  |> to_svg
  |> io.println
}
