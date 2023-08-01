//
//  UILabel+Ext.swift
//  IOSStudyJam
//
//  Created by Vadim Kim on 01.08.2023.
//

import UIKit

extension UILabel {
    func addLeading(image: UIImage?) {
        guard let image = image else { return }
        let attachment = NSTextAttachment()
        attachment.bounds = CGRect(x: 0, y: -2, width: 16, height: 16)
        attachment.image = image

        let result = NSMutableAttributedString(string: "")
        let attachmentString = NSAttributedString(attachment: attachment)
        let string = NSMutableAttributedString(string: self.text ?? "", attributes: [:])

        result.append(attachmentString)
        result.append(string)
        self.attributedText = result
    }
}
