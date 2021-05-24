import Foundation

public struct Color {
    let r: Int
    let g: Int
    let b: Int
    let a: Float
    
    init(red: Int, green: Int, blue: Int, alpha: Float) {
        r = red
        g = green
        b = blue
        a = alpha
    }
    
    public func asHexString() -> String {
        return String(format: "#%02x%02x%02x%02x", r, g, b, Int(a * 255))
    }
}

struct ColorHexString {
    let value: String
    private let intValue: Int
    
    init(_ hex: String) {
        value = ColorHexString.normalize(hex)
        var iv: UInt32 = 0
        Scanner(string: value).scanHexInt32(&iv)
        intValue = Int(iv)
    }
    
    static func normalize(_ hex: String) -> String {
        var hexString = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        //drop hashtag prefix
        if hexString.hasPrefix("#") {
            hexString.remove(at: hexString.startIndex)
        }
        
        //duplicate the shorthand
        if hexString.count == 3 || hexString.count == 4 {
            hexString = hexString.map { "\($0)\($0)" } .joined()
        }
        
        //append alpha if missing
        if hexString.count < 8 {
            hexString += "FF"
        }
        
        return hexString
    }
    
    private enum ColorMasks: Int {
        case red   = 0xff000000
        case green = 0x00ff0000
        case blue  = 0x0000ff00
        case alpha = 0x000000ff
    }
    
    var red: Int {
        get { (intValue & ColorMasks.red.rawValue) >> 24 }
    }
    
    var green: Int {
        get { (intValue & ColorMasks.green.rawValue) >> 16 }
    }
    
    var blue: Int {
        get { (intValue & ColorMasks.blue.rawValue) >> 8 }
    }
    
    var alpha: Float {
        get { Float(intValue & ColorMasks.alpha.rawValue) / 255 }
    }
}

extension Color {
    static func fromHex(_ hex: String) -> Color {
        let hexString = ColorHexString(hex)
        return Color(red: hexString.red, green: hexString.green, blue: hexString.blue, alpha: hexString.alpha)
    }
}

extension Color : ExpressibleByStringLiteral {
    public init(stringLiteral value: String){
        self = Color.fromHex(value)
    }
}

public extension Color {
    static func rgb(_ red: Int, _ green: Int, _ blue: Int) -> Color {
        Color(red: red, green: green, blue: blue, alpha: 1)
    }
}

// MARK: Predefined Colors

extension Color {
    static var aliceBlue: Color = "#f0f8ff"
    static var antiqueWhite: Color = "#faebd7"
    static var aqua: Color = "#00ffff"
    static var aquamarine: Color = "#7fffd4"
    static var azure: Color = "#f0ffff"
    static var beige: Color = "#f5f5dc"
    static var bisque: Color = "#ffe4c4"
    static var black: Color = "#000000"
    static var blanchedAlmond: Color = "#ffebcd"
    static var blue: Color = "#0000ff"
    static var blueViolet: Color = "#8a2be2"
    static var brown: Color = "#a52a2a"
    static var burleywood: Color = "#deb887"
    static var cadetBlue: Color = "#5f9ea0"
    static var chartreuse: Color = "#7fff00"
    static var chocolate: Color = "#d2691e"
    static var coral: Color = "#ff7f50"
    static var cornflowerBlue: Color = "#6495ed"
    static var cornsilk: Color = "#fff8dc"
    static var crimson: Color = "#dc143c"
    static var cyan: Color = "#00ffff"
    static var darkBlue: Color = "#00008B"
    static var darkCyan: Color = "#008B8B"
    static var darkGoldenRod: Color = "#b8860b"
    static var darkGray: Color = "#a9a9a9"
    static var darkGreen: Color = "#006400"
    static var darkKhaki: Color = "#bdb76b"
    static var darkMagenta: Color = "#8b008b"
    static var darkOliveGreen: Color = "#556b2f"
    static var darkOrange: Color = "#ff8c00"
    static var darkOrchid: Color = "#9932cc"
    static var darkRed: Color = "#8b0000"
    static var darkSalmon: Color = "#e9967a"
    static var darkSeaGreen: Color = "#8fbc8f"
    static var darkSlateBlue: Color = "#483d8b"
    static var darkSlateGray: Color = "#2f4f4f"
    static var darkTurqoise: Color = "#00ced1"
    static var darkViolet: Color = "#9400d3"
    static var deepPink: Color = "#ff1493"
    static var deepSkyBlue: Color = "#00bfff"
    static var dimGray: Color = "#696969"
    static var dodgerBlue: Color = "#1e90ff"
    static var fireBrick: Color = "#b22222"
    static var floralWhite: Color = "#fffaf0"
    static var forestGreen: Color = "#228b22"
    static var fuchsia: Color = "#ff00ff"
    static var gainsboro: Color = "#dcdcdc"
    static var ghostWhite: Color = "#f8f8ff"
    static var gold: Color = "#ffd700"
    static var goldenRod: Color = "#daa520"
    static var gray: Color = "#808080"
    static var green: Color = "#008000"
    static var greenYellow: Color = "#adff2f"
    static var honeyDew: Color = "#f0fff0"
    static var hotPink: Color = "#ff69b4"
    static var indianRed: Color = "#cd5c5c"
    static var indigo: Color = "#4b0082"
    static var ivory: Color = "#fffff0"
    static var khaki: Color = "#f0e68c"
    static var lavendar: Color = "#e6e6fa"
    static var lavendarBlush: Color = "#fff0f5"
    static var lawnGreen: Color = "#7cfc00"
    static var lemonChiffon: Color = "#fffacd"
    static var lightBlue: Color = "#add8e6"
    static var lightCoral: Color = "#f08080"
    static var lightCyan: Color = "#e0ffff"
    static var lightGoldenRodYellow: Color = "#fafad2"
    static var lightGray: Color = "#d3d3d3"
    static var lightGreen: Color = "#90EE90"
    static var lightPink: Color = "#ffb6c1"
    static var lightSalmon: Color = "#ffa07a"
    static var lightSeaGreen: Color = "#20b2aa"
    static var lightSkyBlue: Color = "#87cefa"
    static var lightSlateGray: Color = "#778899"
    static var lightSteelBlue: Color = "#b0c4de"
    static var lightYellow: Color = "#ffffe0"
    static var lime: Color = "#00ff00"
    static var limeGreen: Color = "#32cd32"
    static var linen: Color = "#faf0e6"
    static var magenta: Color = "#ff00ff"
    static var maroon: Color = "#800000"
    static var mediumAquaMarine: Color = "#66cdaa"
    static var mediumBlue: Color = "#0000cd"
    static var mediumOrchid: Color = "#ba55d3"
    static var mediumPurple: Color = "#9370db"
    static var mediumSeaGreen: Color = "#3cb371"
    static var mediumSlateBlue: Color = "#7b68ee"
    static var mediumSpringGreen: Color = "#00fa9a"
    static var mediumTurquoise: Color = "#48d1cc"
    static var mediumVioletRed: Color = "#c71585"
    static var midnightBlue: Color = "#191970"
    static var mintCream: Color = "#f5fffa"
    static var mistyRose: Color = "#ffe4e1"
    static var moccasin: Color = "#ffe4b5"
    static var navajoWhite: Color = "#ffdead"
    static var navy: Color = "#000080"
    static var oldLace: Color = "#fdf5e6"
    static var olive: Color = "#808000"
    static var oliveDrab: Color = "#6b8e23"
    static var orange: Color = "#ffa500"
    static var orangeRed: Color = "#ff4500"
    static var orchid: Color = "#da70d6"
    static var paleGoldenRod: Color = "#eee8aa"
    static var paleGreen: Color = "#98fb98"
    static var paleTurquoise: Color = "#afeeee"
    static var paleVioletRed: Color = "#db7093"
    static var papayaWhip: Color = "#ffefd5"
    static var peachPuff: Color = "#ffdab9"
    static var peru: Color = "#cd853f"
    static var pink: Color = "#ffc0cb"
    static var plum: Color = "#dda0dd"
    static var powderBlue: Color = "#b0e0e6"
    static var purple: Color = "#800080"
    static var rebeccaPurple: Color = "#663399"
    static var red: Color = "#ff0000"
    static var rosyBrown: Color = "#bc8f8f"
    static var royalBlue: Color = "#4169e1"
    static var saddleBrown: Color = "#8b4513"
    static var salmon: Color = "#fa8072"
    static var sandyBrown: Color = "#f4a460"
    static var seaGreen: Color = "#2e8b57"
    static var seaShell: Color = "#fff5ee"
    static var sienna: Color = "#a0522d"
    static var silver: Color = "#c0c0c0"
    static var skyBlue: Color = "#87ceeb"
    static var slateBlue: Color = "#6a5acd"
    static var slateGray: Color = "#708090"
    static var snow: Color = "#fffafa"
    static var springGreen: Color = "#00ff7f"
    static var steelBlue: Color = "#4682b4"
    static var tan: Color = "#d2b48c"
    static var teal: Color = "#008080"
    static var thistle: Color = "#d8bfd8"
    static var tomato: Color = "#ff6347"
    static var turquoise: Color = "#40e0d0"
    static var violet: Color = "#ee82ee"
    static var wheat: Color = "#f5deb3"
    static var white: Color = "#ffffff"
    static var whiteSmoke: Color = "#f5f5f5"
    static var yellow: Color = "#ffff00"
    static var yellowGreen: Color = "#9acd32"
}
