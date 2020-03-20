//
//  UIWindow+Transitions.swift
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

public extension UIWindow {

    static let defaultTransitionDuration = TimeInterval(0.25)

    /**
     Replaces this window's root view controller with the specified view controller. Animates the transition using the
     specified animation options and duration.

     - parameter viewController: The new root view controller.
     - parameter duration: The duration of the transition animation, measured in seconds. If you specify a negative
     value or 0, the transition is made without animations.
     - parameter options: A mask of options indicating how you want to perform the animations.
     - parameter completion: A block object to be executed when the animation sequence ends. This block has no return
     value and takes a single `Bool` argument that indicates whether or not the animations actually finished before the
     completion handler was called. If the duration of the animation is 0, this block is performed at the beginning of
     the next run loop cycle. This parameter may be `nil`.
     */
    func replaceRootViewController(with viewController: UIViewController,
                                   options: UIView.AnimationOptions,
                                   duration: TimeInterval = UIWindow.defaultTransitionDuration,
                                   completion: ((Bool) -> Void)? = nil) {

        UIView.transition(with: self, duration: duration, options: options, animations: {
            self.rootViewController = viewController
        }, completion: completion)
    }
}
