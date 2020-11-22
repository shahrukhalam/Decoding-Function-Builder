import Foundation
import UIKit
import PlaygroundSupport

let vc = UIViewController()
PlaygroundPage.current.liveView = vc

let alert = UIAlertController(title: "Mad Max ☠️",
                              message: "Fury Road",
                              preferredStyle: .alert)

let maxAction = UIAlertAction(title: "Max", style: .default) { (_) in
    print("A man, reduced to a single instinct: Survive.")
}

let furiosaAction = UIAlertAction(title: "Furiosa", style: .default) { (_) in
    print("Remember me?!")
}

let joeAction = UIAlertAction(title: "Joe", style: .destructive) { (_) in
    print("I AM YOUR REDEEMER! It is by my hand you will rise from the ashes of this world!")
}

let nuxAction = UIAlertAction(title: "Nux", style: .destructive) { (_) in
    print("I'm the man who grabs the sun, riding to Valhalla!")
}

let cancelAction = UIAlertAction(title: "Green Place", style: .cancel, handler: nil)

alert.addAction(maxAction)
alert.addAction(furiosaAction)
alert.addAction(joeAction)
alert.addAction(nuxAction)
alert.addAction(cancelAction)

vc.present(alert, animated: true)

PlaygroundPage.current.needsIndefiniteExecution = true
