//
//  UIViewController+Instantiation.swift
//  RIUIKitExtensions
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

public extension UIViewController {

    /**
     Instantiates a view controller from a storyboard. Note that the storyboard must define view controller whose
     identifier matches the type name.

     In other words to be able to call `FooViewController.instantiate(from: aStoryboard)`, there must be a
     `FooViewController` with a storyboard identifier of `FooViewController` in `aStoryboard`. If one does not exist, a
     fatal error will be raised.
     */
    static func instantiate(from storyboard: UIStoryboard) -> Self {
        return instantiate(from: storyboard, identifier: String(describing: Self.self))
    }

    /**
     Instantiates a view controller with a given identifier from a storyboard. Note that the storyboard must define a
     view controller whose identifier matches the specified identifier. If one does not exist, a fatal errror will be
     raised.
     */
    static func instantiate(from storyboard: UIStoryboard, identifier id: String) -> Self {
        guard let vc = storyboard.instantiateViewController(withIdentifier: id) as? Self else {
            fatalError("Could not instantiate storyboard with identifier \"\(id)\" from \(storyboard)")
        }
        return vc
    }
}
