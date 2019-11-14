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

    static func featchBundle() -> Bundle? {

        if self.frameworkBundle == nil {
            frameworkBundle = Bundle(path: Bundle(for: UIPOSTStyle.self).path(forResource: "UIPOSTView", ofType: "bundle") ?? "")
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
