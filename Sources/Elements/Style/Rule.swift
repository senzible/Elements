import Foundation

public enum Selector {
    case `class`(String)
    case id(String)
    case element(String)
}

public enum Property {
    case animation
    case background
}


//let style = Style {
//    Display()
//}

public struct BackgroundColor {
    
}

public struct Background {
    var color: Color
}
