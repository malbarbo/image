import color
import gleam/io
import image.{Point, add_polygon, fill, square, to_svg}

pub fn main() {
  square(65.0, [fill(color.lightblue)])
  |> add_polygon([Point(30.0, -20.0), Point(50.0, 50.0), Point(-20.0, 30.0)], [
    fill(color.forestgreen),
  ])
  |> to_svg
  |> io.println
}
