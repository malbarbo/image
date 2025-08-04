import fill
import gleam/io
import image.{ellipse, put_image, rectangle, to_svg}

pub fn main() {
  rectangle(50.0, 50.0, fill.lightgray)
  |> put_image(40.0, 15.0, ellipse(20.0, 30.0, fill.red))
  |> to_svg
  |> io.println
}
