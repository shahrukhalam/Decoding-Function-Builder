import Foundation
import UIKit
import PlaygroundSupport

let quote = "Orange is the New Black"

let orangeAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black,
                        NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 30)]
let blackAttributes = [NSAttributedString.Key.foregroundColor: UIColor.orange,
                       NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 30)]

let orangeString = NSAttributedString(string: "Orange", attributes: orangeAttributes)
let newString = NSAttributedString(string: " is the New ")
let blackString = NSAttributedString(string: "Black", attributes: blackAttributes)

let attributedText = NSMutableAttributedString()
attributedText.append(orangeString)
attributedText.append(newString)
attributedText.append(blackString)

let label = UILabel()

label.attributedText = attributedText
label.sizeToFit()

PlaygroundPage.current.liveView = label
