public struct StatementGroup: Statement {
    public func asCode() -> String {
        var result: String = ""
        
        for member in members {
            result += member.asCode() + "\r\\n"
        }
        
        return result
    }
    
    public var members: [Statement]
    
    public init(members: [Statement]) {
        self.members = members
    }
}

extension StatementGroup: StatementContainer {
    public init(@StatementBuilder content: () -> Self) {
        self = content()
    }
}

extension StatementGroup: Sequence {
    public func makeIterator() -> Array<Statement>.Iterator {
        members.makeIterator()
    }
}
