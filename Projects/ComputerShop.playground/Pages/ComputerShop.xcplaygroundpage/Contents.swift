
struct Computer: CustomStringConvertible {
    var finish: Finish
    var processor: Processor
    var graphics: Graphics
    
    var price: Int {
        return finish.price + processor.price + graphics.price
    }
     
    var description: String {
        return "\nYour configuration: \n\tFinish: \(finish)\n\tProcessor: \(processor)\n\tGraphics: \(graphics)\n\t$\(price)"
    }
}

let officeComputer = Computer(finish: Silver(), processor: Fast(), graphics: Standart())
print(officeComputer)

let highEndComputer = Computer(finish: SpaceGray(), processor: Turbo(), graphics: Ultra())
print(highEndComputer)
