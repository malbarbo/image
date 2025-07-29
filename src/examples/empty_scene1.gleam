import gleam/io
import image.{empty_scene, to_svg}

pub fn main() {
  empty_scene(160.0, 90.0)
  |> to_svg
  |> io.println
}
