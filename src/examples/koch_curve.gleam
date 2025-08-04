import fill
import gleam/io
import image.{Bottom, beside_align, rotate, square, to_svg}

pub fn main() {
  koch_curve(5)
  |> to_svg
  |> io.println
}

fn koch_curve(n) {
  case n <= 0 {
    True -> square(1.0, fill.black)
    False -> {
      let smaller = koch_curve(n - 1)
      smaller
      |> beside_align(Bottom, _, rotate(smaller, 60.0))
      |> beside_align(Bottom, _, rotate(smaller, -60.0))
      |> beside_align(Bottom, _, smaller)
    }
  }
}
