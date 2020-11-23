import Foundation
import UIKit
import PlaygroundSupport

@_functionBuilder
struct StackViewBuilder {
    static func buildBlock(_ actions: UIView...) -> [UIView] {
        return actions
    }
}

extension UIStackView {
    convenience init(frame: CGRect = .zero,
                     axis: NSLayoutConstraint.Axis = .vertical,
                     distribution: UIStackView.Distribution = .fillEqually,
                     @StackViewBuilder _ builder: () -> [UIView]) {
        self.init(arrangedSubviews: builder())
        
        self.frame = frame
        self.axis = axis
        self.distribution = distribution
    }
}

class GreenView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .green
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

let frame = CGRect(origin: .zero, size: CGSize(width: 300, height: 100))
let redView = UIView()
redView.backgroundColor = .red

let stackView = UIStackView(frame: frame) {
    redView
    GreenView()
}

PlaygroundPage.current.liveView = stackView
