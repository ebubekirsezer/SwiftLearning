
func buildLaptop(configuration: [String: String]) -> Laptop? {
    
    guard let model = configuration["base_model"] else {
        return nil
    }
    
    var laptop: Laptop?

    switch model {
    case "budget":
        laptop = Laptop(size: Size.thirteenInch, processor: Processor.i5, graphics: Graphics.intelIrisPlus645)
    case "office":
        laptop = Laptop(size: Size.fifteenInch, processor: Processor.i7, graphics: Graphics.intelIrisPlus645)
    case "high-end":
        laptop = Laptop(size: .fifteenInch, processor: .i9, graphics: .radeonProVega20)
    default:
        print("Unexpected Value")
    }
    
    guard let selectedLaptop = laptop else { return nil }
    
    if let customSize = configuration["size"] {
        switch customSize {
        case "13-inch":
            selectedLaptop.size = .thirteenInch
        case "15-inch":
            selectedLaptop.size = .fifteenInch
        default:
            print("Unexpected Value")
        }
    }
    
    if let processor = configuration["processor"] {
        switch processor {
        case "i5":
            selectedLaptop.processor = .i5
        case "i7":
            selectedLaptop.processor = .i7
        case "i9":
            selectedLaptop.processor = .i9
        default:
            print("Unexpected Value")
        }
    }
    
    if let graphics = configuration["graphics"] {
        switch graphics {
        case "intel-uhd-graphics-617":
            selectedLaptop.graphics = .intelUHD617
        case "intel-iris-plus-graphics-645":
            selectedLaptop.graphics = .intelIrisPlus645
        case "radeon-pro-vega-20":
            selectedLaptop.graphics = .radeonProVega20
        default:
            print("Unexpected Value")
        }
    }
    
    return selectedLaptop
}


if let laptop = buildLaptop(configuration: ["base_model" : "high-end"]) {
    print(laptop)
}

if let laptop = buildLaptop(configuration: ["base_model" : "office",
                                            "size": "13-inch"]) {
    print(laptop)
}
if let laptop = buildLaptop(configuration: ["base_model" : "high-end",
                                            "size": "13-inch",
                                            "graphics": "intel-uhd-graphics-617"]) {
    print(laptop)
}
