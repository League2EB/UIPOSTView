//
//  ViewController.swift
//  UIPOSTView
//
//  Created by League2EB on 11/14/2019.
//  Copyright (c) 2019 League2EB. All rights reserved.
//

import UIKit
import UIPOSTView

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func presentBtnPressed(_ sender: Any) {
        let postViewController = UIPOSTViewController()
        postViewController.delegate = self
        let style = UIPOSTStyle()
        style.maxInputCount = 123
        style.titleText = "Title文字"
        postViewController.postViewStyle = style
        self.present(postViewController, animated: true, completion: nil)
    }
}

extension ViewController: UIPOSTViewControllerDelegate {

    func onCanceled() {
        NSLog("didCancel")
    }

    func onSended(string: String) {
        NSLog("\(string)")
    }
}
