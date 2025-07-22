import color.{type Color}
import gleam/float
import gleam/int
import gleam/list
import gleam/result
import gleam/string
import math.{cos_deg, hypot, sin_deg}

// TODO: add constants for dash
// TODO: rename outline to stroke?
// TODO: wedge
// TODO: all curve funtions
// TODO: all text functions
// TODO: triangle/sa...
// TODO: pulled_regular_polygon
// TODO: scene+...
// TODO: overlay_align
// TODO: overlay_align_offset
// TODO: underlay_align
// TODO: underlay_align_offset
// TODO: beside_align
// TODO: above_align
// TODO: empty_scene
// TODO: place_image
// TODO: place_image_align
// TODO: place_images
// TODO: place_images_align
// TODO: put_image
// TODO: crop_align
// TODO: color_frame
// TODO: bitmap...
// TODO: freeze
// TODO: create pen?
// TODO: equality test
// TODO: pin holes...

// **************************
// * Style
// **************************

pub opaque type Style {
  Fill(Color)
  FillOpacity(Float)
  FillRule(String)
  Outline(Color)
  StokeLineCap(String)
  StokeLineJoin(String)
  StrokeWidth(Float)
  StrokeOpacity(Float)
  StrokeDashArray(List(Int))
}

pub const stroke_linecap_butt = StokeLineCap("butt")

pub const stroke_linecap_round = StokeLineCap("round")

pub const stroke_linecap_square = StokeLineCap("square")

pub const stroke_linejoin_bevel = StokeLineJoin("bevel")

pub const stroke_linejoin_miter = StokeLineJoin("miter")

pub const stroke_linejoin_round = StokeLineJoin("round")

pub const fill_rule_nonzero = FillRule("nonzero")

pub const fill_rule_evenodd = FillRule("evenodd")

pub fn fill(c: Color) -> Style {
  Fill(c)
}

pub fn fill_opacity(opacity: Float) -> Style {
  FillOpacity(float.clamp(opacity, 0.0, 1.0))
}

pub fn outline(c: Color) -> Style {
  Outline(c)
}

pub fn stroke_width(width: Float) -> Style {
  StrokeWidth(positive(width))
}

pub fn stroke_opacity(opacity: Float) -> Style {
  StrokeOpacity(float.clamp(opacity, 0.0, 1.0))
}

pub fn stoke_dash_array(values: List(Int)) -> Style {
  StrokeDashArray(list.map(values, int.max(0, _)))
}

// **************************
// * Point
// **************************

pub type Point {
  Point(x: Float, y: Float)
}

fn point_translate(p: Point, dx: Float, dy: Float) -> Point {
  Point(p.x +. dx, p.y +. dy)
}

fn point_rotate(p: Point, center: Point, angle: Float) -> Point {
  let dx = p.x -. center.x
  let dy = p.y -. center.y

  Point(
    center.x +. dx *. cos_deg(angle) -. dy *. sin_deg(angle),
    center.y +. dx *. sin_deg(angle) +. dy *. cos_deg(angle),
  )
}

fn point_flip_x(p: Point) -> Point {
  Point(0.0 -. p.x, p.y)
}

fn point_flip_y(p: Point) -> Point {
  Point(p.x, 0.0 -. p.y)
}

// **************************
// * Image
// **************************

pub opaque type Image {
  Rectangle(
    style: List(Style),
    center: Point,
    width: Float,
    height: Float,
    angle: Float,
  )
  Ellipse(
    style: List(Style),
    center: Point,
    width: Float,
    height: Float,
    angle: Float,
  )
  Polygon(style: List(Style), points: List(Point))
  Combination(Image, Image)
  Crop(center: Point, width: Float, height: Float, angle: Float, image: Image)
}

pub const empty = Rectangle([], Point(0.0, 0.0), 0.0, 0.0, 0.0)

pub fn width(img: Image) -> Float {
  let #(min, max) = box(img)
  max.x -. min.x
}

pub fn height(img: Image) -> Float {
  let #(min, max) = box(img)
  max.y -. min.y
}

pub fn dimension(img: Image) -> #(Float, Float) {
  let #(min, max) = box(img)
  #(max.x -. min.x, max.y -. min.y)
}

pub fn center(img: Image) -> Point {
  let #(min, max) = box(img)
  Point(mid(max.x, min.x), mid(max.y, min.y))
}

fn translate(img: Image, dx: Float, dy: Float) -> Image {
  case img {
    Rectangle(center:, ..) ->
      Rectangle(..img, center: point_translate(center, dx, dy))
    Ellipse(center:, ..) ->
      Ellipse(..img, center: point_translate(center, dx, dy))
    Polygon(points:, ..) ->
      Polygon(..img, points: list.map(points, point_translate(_, dx, dy)))
    Combination(a, b) -> Combination(translate(a, dx, dy), translate(b, dx, dy))
    Crop(center:, image:, ..) ->
      Crop(
        ..img,
        center: point_translate(center, dx, dy),
        image: translate(image, dx, dy),
      )
  }
}

fn fix_position(img: Image) -> Image {
  let #(min, _) = box(img)
  case min == Point(0.0, 0.0) {
    True -> img
    False -> translate(img, 0.0 -. min.x, 0.0 -. min.y)
  }
}

fn box(img: Image) -> #(Point, Point) {
  case img {
    Rectangle(center:, width:, height:, angle:, ..) -> {
      let hw = width /. 2.0
      let hh = height /. 2.0
      let abs = float.absolute_value
      let dx = hw *. abs(cos_deg(angle)) +. hh *. abs(sin_deg(angle))
      let dy = hw *. abs(sin_deg(angle)) +. hh *. abs(cos_deg(angle))
      #(
        point_translate(center, 0.0 -. dx, 0.0 -. dy),
        point_translate(center, dx, dy),
      )
    }
    Ellipse(center:, width:, height:, angle:, ..) -> {
      let dx = hypot(width *. cos_deg(angle), height *. sin_deg(angle))
      let dy = hypot(width *. sin_deg(angle), height *. cos_deg(angle))
      #(
        point_translate(center, 0.0 -. dx, 0.0 -. dy),
        point_translate(center, dx, dy),
      )
    }
    Combination(a, b) -> {
      let #(amin, amax) = box(a)
      let #(bmin, bmax) = box(b)
      #(
        Point(float.min(amin.x, bmin.x), float.min(amin.y, bmin.y)),
        Point(float.max(amax.x, bmax.x), float.max(amax.y, bmax.y)),
      )
    }
    Polygon(points:, ..) -> {
      let min_x = list.fold(points, 0.0, fn(min, p) { float.min(min, p.x) })
      let min_y = list.fold(points, 0.0, fn(min, p) { float.min(min, p.y) })
      let max_x = list.fold(points, 0.0, fn(max, p) { float.max(max, p.x) })
      let max_y = list.fold(points, 0.0, fn(max, p) { float.max(max, p.y) })
      #(Point(min_x, min_y), Point(max_x, max_y))
    }
    Crop(center:, width:, height:, angle:, ..) -> {
      let hw = width /. 2.0
      let hh = height /. 2.0
      let abs = float.absolute_value
      let dx = hw *. abs(cos_deg(angle)) +. hh *. abs(sin_deg(angle))
      let dy = hw *. abs(sin_deg(angle)) +. hh *. abs(cos_deg(angle))
      #(
        point_translate(center, 0.0 -. dx, 0.0 -. dy),
        point_translate(center, dx, dy),
      )
    }
  }
}

// **************************
// * Basic images
// **************************

pub fn rectangle(width: Float, height: Float, style: List(Style)) -> Image {
  let width = positive(width)
  let height = positive(height)
  Rectangle(style, Point(width /. 2.0, height /. 2.0), width, height, 0.0)
}

pub fn square(side: Float, style: List(Style)) -> Image {
  rectangle(side, side, style)
}

pub fn ellipse(width: Float, height: Float, style: List(Style)) -> Image {
  let hw = positive(width) /. 2.0
  let hh = positive(height) /. 2.0
  Ellipse(style, Point(hw, hh), hw, hh, 0.0)
}

pub fn circle(radius: Float, style: List(Style)) -> Image {
  ellipse(2.0 *. radius, 2.0 *. radius, style)
}

pub fn line(x: Float, y: Float, style: List(Style)) -> Image {
  Polygon(style, [Point(0.0, 0.0), Point(x, y)])
  |> fix_position
}

pub fn add_line(
  img: Image,
  x1: Float,
  y1: Float,
  x2: Float,
  y2: Float,
  style: List(Style),
) -> Image {
  Combination(img, Polygon(style, [Point(x1, y1), Point(x2, y2)]))
  |> fix_position
}

// **************************
// * Polygons
// **************************

pub fn triangle(side: Float, style: List(Style)) -> Image {
  let side = positive(side)
  // side *. sqrt(3.0) /. 2.0
  let height = side *. 0.8660254037844386
  Polygon(style, [
    Point(side /. 2.0, 0.0),
    Point(side, height),
    Point(0.0, height),
  ])
}

pub fn right_triangle(side1: Float, side2: Float, style: List(Style)) -> Image {
  let side1 = positive(side1)
  let side2 = positive(side2)
  Polygon(style, [Point(0.0, 0.0), Point(0.0, side2), Point(side1, side2)])
}

pub fn isosceles_triangle(
  side_length: Float,
  angle: Float,
  style: List(Style),
) -> Image {
  let side_length = positive(side_length)
  let hangle = angle /. 2.0
  Polygon(style, [
    Point(side_length *. sin_deg(hangle), side_length *. cos_deg(hangle)),
    Point(0.0, 0.0),
    Point(0.0 -. side_length *. sin_deg(hangle), side_length *. cos_deg(hangle)),
  ])
  |> fix_position
}

pub fn rhombus(side_length: Float, angle: Float, style: List(Style)) -> Image {
  let side_length = positive(side_length)
  let height = 2.0 *. side_length *. cos_deg(angle /. 2.0)
  let width = 2.0 *. side_length *. sin_deg(angle /. 2.0)
  Polygon(style, [
    Point(0.0, height /. 2.0),
    Point(width /. 2.0, 0.0),
    Point(width, height /. 2.0),
    Point(width /. 2.0, height),
  ])
}

pub fn regular_polygon(
  side_length: Float,
  side_count: Int,
  style: List(Style),
) -> Image {
  star_polygon(side_length, side_count, 1, style)
}

pub fn polygon(points: List(Point), style: List(Style)) -> Image {
  Polygon(style, points) |> fix_position
}

pub fn add_polygon(img: Image, points: List(Point), style: List(Style)) -> Image {
  Combination(img, Polygon(style, points)) |> fix_position
}

pub fn star_polygon(
  side_length: Float,
  side_count: Int,
  step_count: Int,
  style: List(Style),
) -> Image {
  let side_count = int.max(1, side_count)
  let side_countf = int.to_float(side_count)
  let step_count = int.max(1, step_count)
  let radius = positive(side_length) /. { 2.0 *. sin_deg(90.0 /. side_countf) }
  let alpha = case int.is_even(side_count) {
    True -> -180.0 /. side_countf
    False -> -90.0
  }

  list.range(0, side_count - 1)
  |> list.map(fn(i) {
    let theta =
      alpha +. 360.0 *. int.to_float(i * step_count % side_count) /. side_countf
    Point(radius *. cos_deg(theta), radius *. sin_deg(theta))
  })
  |> Polygon(style, _)
  |> fix_position
}

pub fn star(side_length: Float, style: List(Style)) -> Image {
  star_polygon(side_length, 5, 2, style)
}

pub fn radial_start(
  point_count: Int,
  inner_radius: Float,
  outer_radius: Float,
  style: List(Style),
) -> Image {
  let point_count = int.max(2, point_count)
  let inner_radius = positive(inner_radius)
  let outer_radius = positive(outer_radius)
  let alpha = case int.is_even(point_count) {
    True -> -180.0 /. int.to_float(point_count)
    False -> -90.0
  }

  list.range(0, 2 * point_count - 1)
  |> list.flat_map(fn(i) {
    let theta1 =
      alpha +. 360.0 *. int.to_float(i * 2) /. int.to_float(2 * point_count)
    let theta2 =
      alpha +. 360.0 *. int.to_float(i * 2 + 1) /. int.to_float(2 * point_count)
    [
      Point(outer_radius *. cos_deg(theta1), outer_radius *. sin_deg(theta1)),
      Point(inner_radius *. cos_deg(theta2), inner_radius *. sin_deg(theta2)),
    ]
  })
  |> Polygon(style, _)
  |> fix_position
}

fn positive(n: Float) -> Float {
  float.max(0.0, n)
}

// **************************
// * Transformations
// **************************

pub fn rotate(img: Image, angle: Float) -> Image {
  // the api for the user is counter clockwise, but the implementation is clockwise
  rotate_around(img, center(img), 0.0 -. angle)
  |> fix_position
}

fn rotate_around(img: Image, center: Point, angle: Float) -> Image {
  case img {
    Rectangle(..) ->
      Rectangle(
        ..img,
        center: point_rotate(img.center, center, angle),
        angle: img.angle +. angle,
      )
    Ellipse(..) ->
      Ellipse(
        ..img,
        center: point_rotate(img.center, center, angle),
        angle: img.angle +. angle,
      )
    Polygon(..) ->
      Polygon(
        ..img,
        points: list.map(img.points, point_rotate(_, center, angle)),
      )
    Combination(a, b) ->
      Combination(
        rotate_around(a, center, angle),
        rotate_around(b, center, angle),
      )
    Crop(..) ->
      Crop(
        ..img,
        center: point_rotate(img.center, center, angle),
        angle: img.angle +. angle,
        image: rotate_around(img.image, center, angle),
      )
  }
}

pub fn scale(img: Image, factor: Float) -> Image {
  scale_xy(img, factor, factor)
}

pub fn scale_xy(img: Image, x_factor: Float, y_factor: Float) -> Image {
  let x_factor = positive(x_factor)
  let y_factor = positive(y_factor)
  case img {
    Rectangle(width:, height:, ..) ->
      Rectangle(..img, width: width *. x_factor, height: height *. y_factor)
    Ellipse(width:, height:, ..) ->
      Ellipse(..img, width: width *. x_factor, height: height *. y_factor)
    Polygon(points:, ..) ->
      Polygon(
        ..img,
        points: list.map(points, fn(p) {
          Point(p.x *. x_factor, p.y *. y_factor)
        }),
      )
    Combination(a, b) ->
      Combination(
        scale_xy(a, x_factor, y_factor),
        scale_xy(b, x_factor, y_factor),
      )
    Crop(width:, height:, image:, ..) ->
      Crop(
        ..img,
        width: width *. x_factor,
        height: height *. y_factor,
        image: scale_xy(image, x_factor, y_factor),
      )
  }
  |> fix_position
}

pub fn flip_horizontal(img: Image) -> Image {
  flip(img, point_flip_x)
}

pub fn flip_vertical(img: Image) -> Image {
  flip(img, point_flip_y)
}

fn flip(img: Image, point_flip: fn(Point) -> Point) -> Image {
  case img {
    Rectangle(center:, angle:, ..) ->
      Rectangle(..img, center: point_flip(center), angle: 0.0 -. angle)
    Ellipse(center:, angle:, ..) -> {
      Ellipse(..img, center: point_flip(center), angle: 0.0 -. angle)
    }
    Polygon(points:, ..) -> Polygon(..img, points: list.map(points, point_flip))
    Combination(a, b) -> Combination(flip(a, point_flip), flip(b, point_flip))
    Crop(center:, angle:, image:, ..) ->
      Crop(
        ..img,
        center: point_flip(center),
        angle: 0.0 -. angle,
        image: flip(image, point_flip),
      )
  }
  |> fix_position
}

pub fn frame(img: Image) -> Image {
  overlay(img, rectangle(width(img), height(img), [outline(color.black)]))
}

pub fn crop(
  img: Image,
  x: Float,
  y: Float,
  width: Float,
  height: Float,
) -> Image {
  let width = positive(width)
  let height = positive(height)
  Crop(
    Point(width /. 2.0, height /. 2.0),
    width,
    height,
    0.0,
    translate(img, 0.0 -. x, 0.0 -. y),
  )
}

// **************************
// * Overlaying
// **************************

pub fn combine(images: List(Image), op: fn(Image, Image) -> Image) -> Image {
  list.fold(images, empty, op)
}

pub fn above(a: Image, b: Image) -> Image {
  let wa = width(a)
  let wb = width(b)
  let wm = float.max(wa, wb)
  Combination(
    translate(a, mid(wm, wa), 0.0),
    translate(b, mid(wm, wb), height(a)),
  )
}

pub fn above_left(a: Image, b: Image) -> Image {
  Combination(translate(a, 0.0, 0.0), translate(b, 0.0, height(a)))
}

pub fn above_right(a: Image, b: Image) -> Image {
  let wa = width(a)
  let wb = width(b)
  let wm = float.max(wa, wb)
  Combination(translate(a, wm -. wa, 0.0), translate(b, wm -. wb, height(a)))
}

pub fn beside(a: Image, b: Image) -> Image {
  let ha = height(a)
  let hb = height(b)
  let hm = float.max(ha, hb)
  Combination(
    translate(a, 0.0, mid(hm, ha)),
    translate(b, width(a), mid(hm, hb)),
  )
}

pub fn beside_top(a: Image, b: Image) -> Image {
  Combination(a, translate(b, width(a), 0.0))
}

pub fn beside_bottom(a: Image, b: Image) -> Image {
  let ha = height(a)
  let hb = height(b)
  let hm = float.max(ha, hb)
  Combination(translate(a, 0.0, hm -. ha), translate(b, width(a), hm -. hb))
}

pub fn overlay(top: Image, bottom: Image) -> Image {
  let center = center(bottom)
  Combination(
    bottom,
    translate(
      top,
      center.x -. width(top) /. 2.0,
      center.y -. height(top) /. 2.0,
    ),
  )
  |> fix_position
}

pub fn overlay_offset(top: Image, x: Float, y: Float, bottom: Image) -> Image {
  overlay(top, translate(bottom, x, y))
}

pub fn overlay_xy(top: Image, x: Float, y: Float, bottom: Image) -> Image {
  Combination(translate(bottom, x, y), top)
  |> fix_position
}

pub fn underlay(bottom: Image, top: Image) -> Image {
  overlay(top, bottom)
}

pub fn underlay_offset(bottom: Image, x: Float, y: Float, top: Image) -> Image {
  overlay(translate(top, x, y), bottom)
}

pub fn underlay_xy(bottom: Image, x: Float, y: Float, top: Image) -> Image {
  Combination(bottom, translate(top, x, y))
  |> fix_position
}

fn mid(a: Float, b: Float) -> Float {
  { a -. b } /. 2.0
}

pub fn to_svg(img: Image) -> String {
  "<svg "
  <> attrib("width", width(img))
  <> attrib("height", height(img))
  <> "xmlns=\"http://www.w3.org/2000/svg\">\n"
  <> to_svg_(img, 1)
  <> "</svg>"
}

fn to_svg_(img: Image, level: Int) -> String {
  case img {
    Rectangle(style:, center:, width:, height:, angle:) -> {
      ident(level)
      <> "<rect "
      <> attrib("x", center.x -. width /. 2.0)
      <> attrib("y", center.y -. height /. 2.0)
      <> attrib("width", width)
      <> attrib("height", height)
      <> attribs("transform", rotate_str(angle, center))
      <> styles_to_svg(style)
      <> "/>\n"
    }
    Ellipse(style:, center:, width:, height:, angle:) -> {
      ident(level)
      <> "<ellipse "
      <> attrib("cx", center.x)
      <> attrib("cy", center.y)
      <> attrib("rx", width)
      <> attrib("ry", height)
      <> attribs("transform", rotate_str(angle, center))
      <> styles_to_svg(style)
      <> "/>\n"
    }
    Polygon(style:, points: [p1, p2]) -> {
      ident(level)
      <> "<line "
      <> attrib("x1", p1.x)
      <> attrib("y1", p1.y)
      <> attrib("x2", p2.x)
      <> attrib("y2", p2.y)
      <> styles_to_svg(style)
      <> "/>\n"
    }
    Polygon(style:, points:) -> {
      let points =
        points
        |> list.map(fn(p) {
          float.to_string(p.x) <> "," <> float.to_string(p.y)
        })
        |> string.join(" ")
      ident(level)
      <> "<polygon "
      <> attribs("points", points)
      <> styles_to_svg(style)
      <> "/>\n"
    }
    Combination(a, b) ->
      ident(level)
      <> "<g>\n"
      <> to_svg_(a, level + 1)
      <> to_svg_(b, level + 1)
      <> ident(level)
      <> "</g>\n"
    Crop(center:, width:, height:, angle:, image:) -> {
      let clipid = "clip" <> int.to_string(math.clip_id())
      let rect =
        "<rect "
        <> attrib("x", center.x -. width /. 2.0)
        <> attrib("y", center.y -. height /. 2.0)
        <> attrib("width", width)
        <> attrib("height", height)
        <> attribs("transform", rotate_str(angle, center))
        <> "/>"
      ident(level)
      <> "<defs>"
      <> "<clipPath "
      <> attribs("id", clipid)
      <> ">"
      <> rect
      <> "</clipPath>"
      <> "</defs>\n"
      <> ident(level)
      <> "<g "
      <> attribs("clip-path", "url(#" <> clipid <> ")")
      <> ">\n"
      <> to_svg_(image, level + 1)
      <> ident(level)
      <> "</g>\n"
    }
  }
}

fn rotate_str(angle: Float, center: Point) -> String {
  "rotate("
  <> float.to_string(angle)
  <> " "
  <> float.to_string(center.x)
  <> " "
  <> float.to_string(center.y)
  <> ")"
}

fn ident(level: Int) -> String {
  string.repeat(" ", 2 * level)
}

fn attrib(name: String, value: Float) -> String {
  name <> "=\"" <> float.to_string(value) <> "\" "
}

fn attribs(name: String, value: String) -> String {
  name <> "=\"" <> value <> "\" "
}

fn styles_to_svg(styles: List(Style)) -> String {
  case has_outline(styles) && !has_fill(styles) {
    False -> styles
    True -> [fill(color.none), ..styles]
  }
  |> list.map(style_to_svg)
  |> string.join("")
}

fn has_fill(styles: List(Style)) -> Bool {
  styles
  |> list.find(fn(s) {
    case s {
      Fill(_) -> True
      _ -> False
    }
  })
  |> result.is_ok
}

fn has_outline(styles: List(Style)) -> Bool {
  styles
  |> list.find(fn(s) {
    case s {
      Outline(_) -> True
      _ -> False
    }
  })
  |> result.is_ok
}

fn style_to_svg(style: Style) -> String {
  case style {
    Fill(c) -> attribs("fill", color.to_svg(c))
    FillOpacity(v) -> attrib("fill-opacity", v)
    FillRule(v) -> attribs("fill-rule", v)
    Outline(c) -> attribs("stroke", color.to_svg(c))
    StokeLineCap(s) -> attribs("stroke-linecap", s)
    StokeLineJoin(s) -> attribs("stroke-linejoin", s)
    StrokeDashArray(values) ->
      attribs(
        "stroke-dasharray",
        values |> list.map(int.to_string) |> string.join(", "),
      )
    StrokeOpacity(v) -> attrib("stroke-opacity", v)
    StrokeWidth(v) -> attrib("stroke-width", v)
  }
}
