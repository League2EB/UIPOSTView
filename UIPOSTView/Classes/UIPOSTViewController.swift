//
//  UIPOSTViewController.swift
//  FixMoto
//
//  Created by Lazy on 2019/11/12.
//  Copyright © 2019 Lazy. All rights reserved.
//

import UIKit

/// UIPOSTViewControllerDelegate
public protocol UIPOSTViewControllerDelegate: class {
    /// 已經點擊傳送
    func onSended(string: String)
    /// 已經點擊取消
    func onCanceled()
}

public class UIPOSTViewController: UIViewController {

    @IBOutlet var views: UIPOSTViews!

    /// 代理事件
    public weak var delegate: UIPOSTViewControllerDelegate? = nil

    public var postViewStyle = UIPOSTStyle()

    deinit {
        NSLog("%s 釋放", object_getClassName(self))
    }

    public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        let bundle = UIPOSTViewUtil.fetchBundle()
        super.init(nibName: "UIPOSTViewController", bundle: bundle)
        if atof(UIDevice.current.systemVersion) < 13.0 {
            modalPresentationStyle = .overFullScreen
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override public func viewDidLoad() {
        super.viewDidLoad()

        self.setupUIStyle()

        self.views.postTextView.delegate = self
        self.views.postCancelBtn.addTarget(self, action: #selector(didClickCancelHendel), for: .touchUpInside)
        self.views.postSendBtn.addTarget(self, action: #selector(didClickSendHendel), for: .touchUpInside)
    }

    override public func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.views.postTextView.becomeFirstResponder()
    }

    override public func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.view.endEditing(true)
    }

    /// 點擊取消按鈕
    @objc
    private func didClickCancelHendel() {
        self.dismiss(animated: true) { [weak self] in
            guard let self = self else { return }
            self.delegate?.onCanceled()
        }
    }

    @objc
    private func didClickSendHendel() {
        self.dismiss(animated: true) { [weak self] in
            guard let `self` = self else { return }
            self.delegate?.onSended(string: self.views.postTextView.text)
        }
    }

    /// 設定UI
    private func setupUIStyle() {
        self.views.setupStyle(style: self.postViewStyle)
    }
}

extension UIPOSTViewController: UITextViewDelegate {

    public func textViewDidChange(_ textView: UITextView) {
        let result = self.postViewStyle.maxInputCount
        self.views.postLimitLabel.text = String(format: "\(textView.text.count)/\(result)")
        self.detectInputLenght(textCount: textView.text.count)
    }

    public func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if text.count == 0 {
            if textView.text.count != 0 {
                return true
            }
        } else if textView.text.count == self.postViewStyle.maxInputCount {
            return false
        }
        return true
    }

    private func detectInputLenght(textCount: Int) {
        if textCount > 0 {
            self.views.postSendBtn.isEnabled = true
        } else {
            self.views.postSendBtn.isEnabled = false
        }
    }
}
