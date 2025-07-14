///////

import color.{type Color}
import gleam/float
import gleam/list
import gleam/result
import gleam/string
import math.{cos_deg, hypot, sin_deg}

pub opaque type Style {
  Fill(Color)
  Outline(Color)
}

pub fn fill(c: Color) -> Style {
  Fill(c)
}

pub fn outline(c: Color) -> Style {
  Outline(c)
}

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
  Combination(Image, Image)
}

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
    Rectangle(..) ->
      Rectangle(..img, center: point_translate(img.center, dx, dy))
    Ellipse(..) -> Ellipse(..img, center: point_translate(img.center, dx, dy))
    Combination(a, b) -> {
      Combination(translate(a, dx, dy), translate(b, dx, dy))
    }
  }
}

fn box(img: Image) -> #(Point, Point) {
  case img {
    Combination(a, b) -> {
      let #(amin, amax) = box(a)
      let #(bmin, bmax) = box(b)
      #(
        Point(float.min(amin.x, bmin.x), float.min(amin.y, bmin.y)),
        Point(float.max(amax.x, bmax.x), float.max(amax.y, bmax.y)),
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
  }
}

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

fn positive(n: Float) -> Float {
  float.max(0.0, n)
}

pub fn rotate(img: Image, angle: Float) -> Image {
  let img = rotate_around(img, center(img), angle)
  let #(min, _) = box(img)
  translate(img, 0.0 -. min.x, 0.0 -. min.y)
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
    Combination(a, b) ->
      Combination(
        rotate_around(a, center, angle),
        rotate_around(b, center, angle),
      )
  }
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
    Combination(a, b) ->
      ident(level)
      <> "<g>\n"
      <> to_svg_(a, level + 1)
      <> to_svg_(b, level + 1)
      <> ident(level)
      <> "</g>\n"
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
    Fill(c) -> "fill=\"" <> color.to_svg(c) <> "\" "
    Outline(c) -> "stroke=\"" <> color.to_svg(c) <> "\" "
  }
}
