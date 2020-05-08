//
//  UIColor+Hex.swift
//  UIKitExtensions
//
//  Copyright (c) 2020 Rocket Insights, Inc.
//
//  Permission is hereby granted, free of charge, to any person obtaining a
//  copy of this software and associated documentation files (the "Software"),
//  to deal in the Software without restriction, including without limitation
//  the rights to use, copy, modify, merge, publish, distribute, sublicense,
//  and/or sell copies of the Software, and to permit persons to whom the
//  Software is furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
//  FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
//  DEALINGS IN THE SOFTWARE.
//

import UIKit

private func colorComponent(fromByte: UInt8) -> CGFloat {
    return CGFloat(fromByte) / 255.0
}

private func colorByte(fromComponent: CGFloat) -> UInt8 {
    return UInt8(fromComponent * 255.0)
}

public extension UIColor {

    convenience init(r: Int, g: Int, b: Int, a: CGFloat = 1.0) {
        func confineColorValue(value: Int) -> Int {
            var adjustedValue = value

            adjustedValue = value > 255 ? 255 : value
            adjustedValue = value < 0 ? 0 : value

            return adjustedValue
        }

        let red = confineColorValue(value: r)
        let green = confineColorValue(value: g)
        let blue = confineColorValue(value: b)

        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: a)
    }

    convenience init(rgbHex: Int, alpha: CGFloat = 1) {
        self.init(r: (rgbHex >> 16) & 0xFF, g: (rgbHex >> 8) & 0xFF, b: rgbHex & 0xFF, a: alpha)
    }

    var rgbaComponents: (r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat) {
        var r = CGFloat(0)
        var g = CGFloat(0)
        var b = CGFloat(0)
        var a = CGFloat(0)

        getRed(&r, green: &g, blue: &b, alpha: &a)
        return (r, g, b, a)
    }

    var hexString: String {
        let (r, g, b, _) = rgbaComponents
        return String(format: "#%02X%02X%02X", colorByte(fromComponent: r), colorByte(fromComponent: g), colorByte(fromComponent: b))
    }

    static func colorFromHex(red: UInt8, green: UInt8, blue: UInt8, alpha: UInt8) -> UIColor {
        return UIColor(red: colorComponent(fromByte: red), green: colorComponent(fromByte: green), blue: colorComponent(fromByte: blue), alpha: colorComponent(fromByte: alpha))
    }
}
