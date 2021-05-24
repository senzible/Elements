public protocol StatementContainer : Statement {
    init(@StatementBuilder content: @escaping ContentProvider)
}

public extension StatementContainer {
    init() {
        self.init {}
    }
    
    init(_ statement: Statement) {
        self.init { statement }
    }
}
