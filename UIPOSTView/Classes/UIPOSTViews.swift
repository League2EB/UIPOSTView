//
//  UIPOSTViews.swift
//  FixMoto
//
//  Created by Lazy on 2019/11/12.
//  Copyright © 2019 Lazy. All rights reserved.
//

import UIKit

internal class UIPOSTViews: NSObject {

    /// 背景View
    @IBOutlet weak var postBackgroundView: UIPOSTBackgroundView!
    /// 上方操作View
    @IBOutlet weak var postTopBarView: UIView!
    /// 標題
    @IBOutlet weak var postViweTitleLabel: UILabel!
    /// 字數限制
    @IBOutlet weak var postLimitLabel: UILabel!
    /// 內容
    @IBOutlet weak var postTextView: UITextView! {
        didSet {
            self.postTextView.tintColor = .white
        }
    }
    /// 取消按鈕
    @IBOutlet weak var postCancelBtn: UIButton!
    /// 發送按鈕
    @IBOutlet weak var postSendBtn: UIButton!

    @IBOutlet weak var topBarConstrains: NSLayoutConstraint! {
        didSet {
            if !UIPOSTViewUtil.hasSafeArea && atof(UIDevice.current.systemVersion) < 11.0 {
                self.topBarConstrains.constant = UIApplication.shared.statusBarFrame.height
            }
        }
    }

    internal func setupStyle(style: UIPOSTStyle) {
        self.postBackgroundView.backgroundColor = style.backgroundColor
        self.postSendBtn.setImage(style.sendImage, for: .normal)
        self.postCancelBtn.setImage(style.cancelImage, for: .normal)
        self.postTopBarView.backgroundColor = style.topBarColor
        self.postViweTitleLabel.textColor = style.titleLabelColor
        self.postTextView.textColor = style.contentTextColor
        self.postLimitLabel.textColor = style.limitLabelColor
        self.postLimitLabel.text = "\(style.maxInputCount)/\(style.maxInputCount)"
        self.postViweTitleLabel.text = style.titleText
    }
}
