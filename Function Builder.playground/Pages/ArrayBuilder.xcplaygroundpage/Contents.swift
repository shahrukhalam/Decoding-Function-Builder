import Foundation

@_functionBuilder
struct ArrayBuilder {
    static func buildBlock<E>(_ elements: E...) -> [E] {
        return elements
    }
}

extension Array {
    init(@ArrayBuilder _ builder: () -> [Element]) {
        self = builder()
    }
}

let intArray = Array {
    7
    8
    6
}
// Prints: [7, 8, 6]
print(intArray)

let stringArray = Array {
    "Jon"
    "Arya"
    "Sansa"
    "Bran"
}
// Prints: ["Jon", "Arya", "Sansa", "Bran"]
print(stringArray)

ArrayBuilder.buildBlock(7, 8, 6)
