//
//  UIPOSTViewUtil.swift
//  PODDemo
//
//  Created by Lazy on 2019/11/14.
//

import Foundation

class UIPOSTViewUtil {

    private static var sharedConfig = UIPOSTViewUtil()

    private static var frameworkBundle: Bundle? = nil

    static func fetchBundle() -> Bundle? {

        if self.frameworkBundle == nil {
            frameworkBundle = Bundle(path: Bundle(for: UIPOSTViewUtil.self).path(forResource: "UIPOSTViewResource", ofType: "bundle") ?? "")
        }
        return frameworkBundle
    }

    static var hasSafeArea: Bool {
        guard #available(iOS 11.0, *), let topPadding = UIApplication.shared.keyWindow?.safeAreaInsets.top, topPadding > 24 else {
            return false
        }
        return true
    }
}

///直接使用ImageLiteral讀取Bunlde裡面的圖片
internal struct WrappedBundleImage: _ExpressibleByImageLiteral {
    let image: UIImage?

    init(imageLiteralResourceName name: String) {
        image = UIImage(named: name, in: UIPOSTViewUtil.fetchBundle(), compatibleWith: nil)
    }
}

extension UIImage {
    static func fromWrappedBundleImage(_ wrappedImage: WrappedBundleImage) -> UIImage? {
        return wrappedImage.image
    }
}
