import Foundation
import UIKit
import PlaygroundSupport

@_functionBuilder
struct AttributedStringBuilder {
    static func buildBlock(_ components: NSAttributedString...) -> NSAttributedString {
        let result = NSMutableAttributedString(string: "")
        components.forEach(result.append)
        return result
    }

    static func buildExpression(_ text: String) -> NSAttributedString {
        NSAttributedString(string: text, attributes: [:])
    }

    static func buildExpression(_ attributedString: NSAttributedString) -> NSAttributedString {
        attributedString
    }
}

extension NSAttributedString {
    func font(_ font: UIFont) -> NSAttributedString {
        let attributedString = NSMutableAttributedString(attributedString: self)
        let attributes = [NSAttributedString.Key.font: font]
        attributedString.addAttributes(attributes,
                                       range: NSRange(location: 0, length: string.count))
        return attributedString
    }

    func foregroundColor(_ color: UIColor) -> NSAttributedString {
        let attributedString = NSMutableAttributedString(attributedString: self)
        let attributes = [NSAttributedString.Key.foregroundColor: color]
        attributedString.addAttributes(attributes,
                                       range: NSRange(location: 0, length: string.count))
        return attributedString
    }
}

extension NSAttributedString {
    convenience init(@AttributedStringBuilder _ builder: () -> NSAttributedString) {
        self.init(attributedString: builder())
    }
}

let attributedText = NSAttributedString {
    NSAttributedString { "Orange" }
        .foregroundColor(.black)
        .font(.boldSystemFont(ofSize: 30))
    " is the New "
    NSAttributedString { "Black" }
        .foregroundColor(.orange)
        .font(.boldSystemFont(ofSize: 30))
}

let label = UILabel()

label.attributedText = attributedText
label.sizeToFit()

PlaygroundPage.current.liveView = label
