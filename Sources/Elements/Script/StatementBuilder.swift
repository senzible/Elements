@resultBuilder public enum StatementBuilder {
    public static func buildBlock(_ statements: Statement...) -> StatementGroup {
        StatementGroup(members: statements)
    }
    
    public static func buildArray(_ statementGroups: [StatementGroup]) -> StatementGroup {
        StatementGroup(members: statementGroups.compactMap { $0 })
    }
    
    public static func buildEither(first component: StatementGroup) -> StatementGroup {
        component
    }
    
    public static func buildEither(second component: StatementGroup) -> StatementGroup {
        component
    }
    
    public static func buildOptional(_ component: StatementGroup?) -> StatementGroup {
        component ?? StatementGroup(members: [])
    }
    
}
