public protocol Statement {
    typealias ContentProvider = () -> StatementGroup
    
    func asCode() -> String
}
