import Foundation

public struct Script : StatementContainer {
    let statements: StatementGroup
    
    public init(@StatementBuilder content: @escaping ContentProvider) {
        statements = content()
    }
    
    public func asCode() -> String {
        var result: String = ""
        
        result += "<script>\n"
        
        for member in statements {
            result += member.asCode() + "\n"
        }
        
        result += "</script>"
        
        return result
    }
}

//
//<script>
//
// javascript goes here
//
//</script>
//

public struct Comment : Statement {
    public func asCode() -> String {
        return "// \(value);"
    }
    
    let value: String
    
    init(_ value: String) {
        self.value = value
    }
}

public struct Let : Statement {
    let key: String
    let value: String
    
    public func asCode() -> String {
        return "\(key) = \(value);"
    }
}


let b = Script {
    Let(key: "firstLetValue", value: "The revolution will not be televised.")
    Comment("javascript goes here")
    Comment("javascript goes here")
}


