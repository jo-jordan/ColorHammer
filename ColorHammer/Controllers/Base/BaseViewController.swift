//
//  BaseViewController.swift
//  ColorHammer
//
//  Created by lzjlxebr on 2020/8/29.
//

import UIKit

class BaseViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        if #available(iOS 13.0, *) {
            self.view.backgroundColor = .systemBackground
        } else {
            // Fallback on earlier versions
            self.view.backgroundColor = .white
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if let globalFontName = LocalStorage.getValue(for: .PreferredFontNameKey) as? String {
            UILabel.appearance().substituteFontName = globalFontName; // USE YOUR FONT NAME INSTEAD
            UITextView.appearance().substituteFontName = globalFontName; // USE YOUR FONT NAME INSTEAD
            UITextField.appearance().substituteFontName = globalFontName;
        }
    }
}
