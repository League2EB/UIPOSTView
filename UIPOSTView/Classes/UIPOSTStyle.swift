//
//  UIPOSTStyle.swift
//  FixMoto
//
//  Created by Lazy on 2019/11/12.
//  Copyright © 2019 Lazy. All rights reserved.
//

import Foundation
import UIKit

public class UIPOSTStyle {

    /// 背景顏色
    public var backgroundColor: UIColor
    /// 標題顏色
    public var titleLabelColor: UIColor
    /// 內容文字顏色
    public var contentTextColor: UIColor
    /// 上方Bar顏色
    public var topBarColor: UIColor
    /// 取消按鈕圖片
    public var cancelImage: UIImage
    /// 送出按鈕圖片
    public var sendImage: UIImage
    /// 限制文字顏色
    public var limitLabelColor: UIColor
    /// 最大限制文字數量
    public var maxInputCount: Int
    /// 標題文字
    public var titleText: String

    public init(backgroundColor: UIColor = #colorLiteral(red: 0, green: 0.4862745098, blue: 0.7411764706, alpha: 0.6236795775), titleLabelColor: UIColor = .white, contentTextColor: UIColor = .white, topBarColor: UIColor = #colorLiteral(red: 0, green: 0.4862745098, blue: 0.7411764706, alpha: 1), limitLabelColor: UIColor = .white, maxInputCount: Int = 20, titleText: String = "") {
        self.backgroundColor = backgroundColor
        self.titleLabelColor = titleLabelColor
        self.contentTextColor = contentTextColor
        self.topBarColor = topBarColor
        self.cancelImage = UIImage(named: "icon_cancel", in: UIPOSTViewUtil.featchBundle(), compatibleWith: nil)!
        self.sendImage = UIImage(named: "icon_send", in: UIPOSTViewUtil.featchBundle(), compatibleWith: nil)!
        self.limitLabelColor = limitLabelColor
        self.maxInputCount = maxInputCount
        self.titleText = titleText
    }

    /// 使用手機比例獲取圖片，器用
    /// - Parameter name: 名稱
    @available(*, deprecated, message: "該pod棄用此方法，因為使用了xcassets後不需要特別計算")
    static func imageNamed(name: String) -> UIImage? {
        var scal = UIScreen.main.scale
        if scal < 2 {
            scal = 2
        } else if scal > 3 {
            scal = 3
        }
        let path = name + "@\(Int(scal))x"
        let img = UIImage(named: path, in: UIPOSTViewUtil.featchBundle(), compatibleWith: nil)
        return img
    }
}
