import Foundation
import UIKit
import PlaygroundSupport

let vc = UIViewController()
PlaygroundPage.current.liveView = vc

@_functionBuilder
struct AlertControllerBuilder {
    static func buildBlock(_ actions: UIAlertAction...) -> [UIAlertAction] {
        return actions
    }
}

extension UIAlertController {
    convenience init(title: String?,
                     message: String?,
                     preferredStyle: UIAlertController.Style,
                     @AlertControllerBuilder _ builder: () -> [UIAlertAction]) {
        self.init(title: title, message: message, preferredStyle: preferredStyle)

        builder().forEach(addAction)
    }
}

let alert = UIAlertController(title: "Mad Max ☠️",
                              message: "Fury Road",
                              preferredStyle: .alert) {
    UIAlertAction(title: "Max", style: .default) { (_) in
        print("A man, reduced to a single instinct: Survive.")
    }

    UIAlertAction(title: "Furiosa", style: .default) { (_) in
        print("Remember me?!")
    }

    UIAlertAction(title: "Joe", style: .destructive) { (_) in
        print("I AM YOUR REDEEMER! It is by my hand you will rise from the ashes of this world!")
    }

    UIAlertAction(title: "Nux", style: .destructive) { (_) in
        print("I'm the man who grabs the sun, riding to Valhalla!")
    }

    UIAlertAction(title: "Green Place", style: .cancel, handler: nil)
}

vc.present(alert, animated: true)

PlaygroundPage.current.needsIndefiniteExecution = true
