public struct HTMLDocument {
    let head: HeadElement
    //let body: BodyElement
}

public struct HeadElement {
    let title: TitleElement
    let base: BaseElement?
    let styles: [StyleElement]
    let relations: [ExternalResourceLinkElement]
    let metadata: [MetadataElement]
}

public struct BaseElement {
    let value: String
}

public struct TitleElement {
    let value: String
}

public struct ExternalResourceLinkElement {
    
}

public struct StyleElement {}
public struct MetadataElement {}

//public struct BodyElement {
//    let contents: [HTMLBodyParts] //naming
//}

actor Drone {
    var name: String
    
    init(_ name: String) {
        self.name = name
    }
}



func change(other: Drone) async {
    await print(other.name)
    
    _ = detach {
        await print(other.name)
    }
}
