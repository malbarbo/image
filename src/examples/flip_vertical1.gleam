import color
import gleam/io
import image.{above, fill, flip_vertical, scale_xy, star, to_svg}

pub fn main() {
  star(40.0, [fill(color.firebrick)])
  |> above(
    star(40.0, [fill(color.gray)]) |> flip_vertical |> scale_xy(1.0, 0.5),
  )
  |> to_svg
  |> io.println
}
