//
//  ActivityIndicator.swift
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

public class ActivityIndicator: UIView {

    private init(parentView: UIView) {
        super.init(frame: parentView.bounds)

        autoresizingMask = [.flexibleWidth, .flexibleHeight]
        backgroundColor = UIColor.clear

        let spinner: UIActivityIndicatorView
        if #available(iOS 13.0, *) {
            spinner = UIActivityIndicatorView(style: .large)
            spinner.color = .white
        } else {
            spinner = UIActivityIndicatorView(style: .whiteLarge)
        }

        let margin = CGFloat(30)

        let overlay = UIView(frame: CGRect(x: 0, y: 0,
                                           width: spinner.bounds.width + margin * 2,
                                           height: spinner.bounds.height + margin * 2))
        overlay.autoresizingMask = [.flexibleLeftMargin, .flexibleRightMargin,
                                    .flexibleTopMargin, .flexibleBottomMargin]
        overlay.backgroundColor = UIColor(white: 0, alpha: 0.75)
        overlay.layer.cornerRadius = 10

        overlay.addSubview(spinner)
        spinner.center = overlay.center

        overlay.center = self.center
        addSubview(overlay)

        parentView.addSubview(self)
        spinner.startAnimating()
    }

    required init?(coder aDecoder: NSCoder) {
        return nil
    }

    public static func add(to view: UIView?) -> ActivityIndicator? {
        guard let view = view else {
            return nil
        }
        return ActivityIndicator(parentView: view)
    }
}
