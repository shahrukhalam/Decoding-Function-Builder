import Foundation

protocol View {
    associatedtype Body : View
    var body: Self.Body { get }
}

@_functionBuilder
struct ViewBuilder {
    static func buildBlock() -> EmptyView {
        return EmptyView()
    }
    
    static func buildBlock<Content>(_ content: Content) -> Content where Content : View {
        return content
    }
    
    static func buildBlock<C0, C1>(_ c0: C0, _ c1: C1) -> TupleView<(C0, C1)>
    where C0 : View, C1 : View {
        return TupleView((c0, c1))
    }
}

// View + Never
extension Never: View {
    typealias Body = Never
}

extension View where Self.Body == Never {
    var body: Body {
        fatalError("It's a Never: Doesn't have a real Body")
    }
}

// EmptyView
struct EmptyView: View {  }

// TupleView
struct TupleView<T>: View {
    let value: T
    
    init(_ value: T) {
        self.value = value
    }
}

// Text
struct Text: View {
    let text: String
    
    init(_ text: String) {
        self.text = text
    }
}

// Button
struct Button: View {
    let title: String
    
    init(_ title: String) {
        self.title = title
    }
}

struct VStackAlias<Content>: View where Content: View {
    var body: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.body = content()
    }
}

// 1
let vStackAlias1 = VStackAlias {  }
// Prints: VStackAlias<EmptyView>
print(type(of: vStackAlias1))
// Prints: VStackAlias<EmptyView>(body: __lldb_expr_26.EmptyView())
print(vStackAlias1)

// 2
let vStackAlias2 = VStackAlias {
    Text("Hello")
}
// Prints: VStackAlias<Text>
print(type(of: vStackAlias2))
// Prints: VStackAlias<Text>(body: __lldb_expr_28.Text(text: "Hello"))
print(vStackAlias2)

// 3
let vStackAlias3 = VStackAlias {
    Text("Hello")
    Button("Click Me")
}
// Prints: VStackAlias<TupleView<(Text, Button)>>
print(type(of: vStackAlias3))
// Prints: VStackAlias<TupleView<(Text, Button)>>(body: __lldb_expr_32.TupleView<(__lldb_expr_32.Text, __lldb_expr_32.Button)>(value: (__lldb_expr_32.Text(text: "Hello"), __lldb_expr_32.Button(title: "Click Me"))))
print(vStackAlias3)
