//
//  UIViewController+Alert.swift
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

public extension UIViewController {

    /**
     Show an alert for the specified error. If the error is non-nil, its localized description will be shown as the
     message. Otherwise, a generic error message is shown.

     - parameter error: The error to be displayed.
     - parameter dismissHandler: The callback to be invoked when the alert's action is performed.
     */
    @objc func show(_ error: Error?, dismissHandler: (() -> Void)? = nil) {
        let message = error?.localizedDescription ??
            NSLocalizedString("An error occurred", comment: "Generic error alert message")
        show(errorMessage: message, dismissHandler: dismissHandler)
    }

    /**
     Show an alert for the specified error.

     - parameter errorMessage: The error message to be displayed.
     - parameter dismissHandler: The callback to be invoked when the alert's action is performed.
     */
    @objc func show(errorMessage: String, dismissHandler: (() -> Void)? = nil) {
        let title = NSLocalizedString("Error", comment: "Error alert title")
        showAlert(title: title,
                  message: errorMessage,
                  dismissHandler: dismissHandler)
    }

    /**
     Show an alert with the specified title and message.

     - parameter title: The title of the alert.
     - parameter message: The alert message.
     - parameter dismissHandler: The callback to be invoked when the alert's action is performed.
     */
    @objc func showAlert(title: String, message: String? = nil, dismissHandler: (() -> Void)? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let title = NSLocalizedString("OK", comment: "OK")

        alert.addAction(UIAlertAction(title: title, style: .default, handler: { _ in
            dismissHandler?()
        }))

        present(alert, animated: true)
    }
}
