import Foundation

protocol Camera: CustomStringConvertible {
    var price: Float { get }
}

class Mirrorless: Camera {
    var price: Float { return 500 }
    var description: String { "Mirrorless" }
}

class Compact: Camera {
    var price: Float = 200
    var description: String = "Mirrorless"
}

class DSLR: Camera {
    var price: Float = 1500
    var description: String = "Mirrorless"
}

struct FeaturePrice {
    static let viewFinder: Float = 75
    static let lcd: Float = 50
    static let videoCapture: Float = 100
}

protocol CameraDecorator: Camera {
    var wrapped: Camera { get }
    init(wrapped: Camera)
}

extension CameraDecorator {
    var price: Float { wrapped.price }
    var description: String { wrapped.description }
}

struct LCDDectorator: CameraDecorator {
    var wrapped: Camera
    
    init(wrapped: Camera) {
        self.wrapped = wrapped
    }
    
    var price: Float {
        wrapped.price + FeaturePrice.lcd
    }
    
    var description: String {
        wrapped.description + ", LCD"
    }
}

struct VideoCaptureDectorator: CameraDecorator {
    var wrapped: Camera
    
    init(wrapped: Camera) {
        self.wrapped = wrapped
    }
    
    var price: Float {
        wrapped.price + FeaturePrice.videoCapture
    }
    
    var description: String {
        wrapped.description + ", Video Recording"
    }
}

struct ViewFinderDectorator: CameraDecorator {
    var wrapped: Camera
    
    init(wrapped: Camera) {
        self.wrapped = wrapped
    }
    
    var price: Float {
        wrapped.price + FeaturePrice.viewFinder
    }
    
    var description: String {
        wrapped.description + ", View Finder"
    }
}

var camera: Camera = Mirrorless()
print("\(camera)\n\t$\(camera.price)")

camera = LCDDectorator(wrapped: camera)
print("\(camera)\n\t$\(camera.price)")

camera = ViewFinderDectorator(wrapped: camera)
print("\(camera)\n\t$\(camera.price)")

camera = VideoCaptureDectorator(wrapped: camera)
print("\(camera)\n\t$\(camera.price)")

camera = LCDDectorator(wrapped: camera)
print("\(camera)\n\t$\(camera.price)")


//class MirrorlessWithViewFinder: Mirrorless {
//    override var price: Float { super.price + FeaturePrice.viewFinder }
//    override var description: String { super.description + ", " + "View Finder" }
//}
//
//class MirrorlessWithLCD: Mirrorless {
//    override var price: Float { super.price + FeaturePrice.lcd }
//    override var description: String { super.description + ", " + "LCD" }
//}
//
//class MirrorlessWithVideoCapture: Mirrorless {
//    override var price: Float { super.price + FeaturePrice.videoCapture }
//    override var description: String { super.description + ", " + "Video Recording" }
//}
//
//let baseMirrorless = Mirrorless()
//print("\(baseMirrorless) \n\t\(baseMirrorless.price)")
//
//let mirrorlessViewFinder = MirrorlessWithViewFinder()
//print("\(mirrorlessViewFinder) \n\t\(mirrorlessViewFinder.price)")
//
//let mirrorlessLCD = MirrorlessWithLCD()
//print("\(mirrorlessLCD) \n\t\(mirrorlessLCD.price)")
