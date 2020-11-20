import SwiftUI
import PlaygroundSupport

// 1
let vStack1 = VStack {  }
// Prints: VStack<EmptyView>
print(type(of: vStack1))
/*
Prints: VStack<EmptyView>(_tree: SwiftUI._VariadicView.Tree<SwiftUI._VStackLayout, SwiftUI.EmptyView>
                                 (root: SwiftUI._VStackLayout(alignment: SwiftUI.HorizontalAlignment(key: SwiftUI.AlignmentKey(bits: 140735441303016)),
                                                              spacing: nil),
                                  content: SwiftUI.EmptyView()))
*/
print(vStack1)

// 2
let vStack2 = VStack { Text("Hello") }
// Prints: VStack<Text>
print(type(of: vStack2))
/*
Prints: VStack<Text>(_tree: SwiftUI._VariadicView.Tree<SwiftUI._VStackLayout, SwiftUI.Text>
                            (root: SwiftUI._VStackLayout(alignment: SwiftUI.HorizontalAlignment(key: SwiftUI.AlignmentKey(bits: 140735441303016)),
                                                         spacing: nil),
                             content: SwiftUI.Text(storage: SwiftUI.Text.Storage.anyTextStorage(SwiftUI.(unknown context at $7fff56a62528).LocalizedTextStorage),
                                                   modifiers: [])))
*/
print(vStack2)

// 3
let vStack3 = VStack {
    Text("World")               // SwiftUI.Text
    Button("Click Me") {  }     // SwiftUI.Button<SwiftUI.Text>
}

// Prints: VStack<TupleView<(Text, Text, Button<Text>)>>
print(type(of: vStack3))

/*
Prints: VStack<TupleView<(Text, Button<Text>)>>
        (_tree: SwiftUI._VariadicView.Tree<SwiftUI._VStackLayout,
                                           SwiftUI.TupleView<(SwiftUI.Text,
                                                              SwiftUI.Button<SwiftUI.Text>)>>
                (root: SwiftUI._VStackLayout(alignment: SwiftUI.HorizontalAlignment(key: SwiftUI.AlignmentKey(bits: 140735441303016)),
                                             spacing: nil),
                 content: SwiftUI.TupleView<(SwiftUI.Text,
                                             SwiftUI.Button<SwiftUI.Text>)>
                          (value: (SwiftUI.Text(storage: SwiftUI.Text.Storage.anyTextStorage(SwiftUI.(unknown context at $7fff56a62528).LocalizedTextStorage),
                                                modifiers: []),
                                   SwiftUI.Button<SwiftUI.Text>(_label: SwiftUI.Text(storage: SwiftUI.Text.Storage.anyTextStorage(SwiftUI.(unknown context at $7fff56a62528).LocalizedTextStorage),
                                                                modifiers: []),
                                                                action: (Function))))))
*/
print(vStack3)

PlaygroundPage.current.setLiveView(vStack3)
