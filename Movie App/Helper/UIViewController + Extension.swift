//
//  UIViewController + Extension.swift
//  Movie App
//
//  Created by Rufan Abdurahmanov on 14.06.22.
//

import UIKit

import SafariServices

extension UIViewController {
    func showWebView(_ urlString: String) {
        if let url = URL(string: urlString) {
            let vc = SFSafariViewController(url: url)
            self.present(vc, animated: true)
        }
    }
}
