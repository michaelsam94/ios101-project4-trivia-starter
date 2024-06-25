//
//  MultiLineButton.swift
//  Trivia
//
//  Created by Michael on 25/06/2024.
//

import UIKit

class MultiLineButton: UIButton {

    // MARK: - Init

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        self.commonInit()
    }

    private func commonInit() {
        self.titleLabel?.numberOfLines = 0
        self.titleLabel?.lineBreakMode = .byWordWrapping
    }

    // MARK: - Overrides

    override var intrinsicContentSize: CGSize {
        titleLabel?.intrinsicContentSize ?? .zero
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        titleLabel?.preferredMaxLayoutWidth = titleLabel?.frame.size.width ?? 0
        super.layoutSubviews()
    }

}

