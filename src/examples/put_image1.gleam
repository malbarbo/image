import color
import gleam/io
import image.{ellipse, fill, put_image, rectangle, to_svg}

pub fn main() {
  rectangle(50.0, 50.0, [fill(color.lightgray)])
  |> put_image(40.0, 15.0, ellipse(20.0, 30.0, [fill(color.red)]))
  |> to_svg
  |> io.println
}
