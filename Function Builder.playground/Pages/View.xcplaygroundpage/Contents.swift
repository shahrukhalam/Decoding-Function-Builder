import Foundation

protocol View {
    associatedtype Body : View
    var body: Self.Body { get }
}
