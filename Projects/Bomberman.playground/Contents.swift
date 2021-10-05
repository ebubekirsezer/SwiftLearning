import UIKit



struct BomberPosition {
      var x = 0
      var y = 0
  }

struct BomberModel{
      var name = "."
      var explosionIcon = "0"
      var positionx:BomberPosition?
}



var grid = [".......", "...💣...", "....💣..",
        ".......", "💣💣.....", "💣💣....."]




func bomberMan2(n: Int, grid: [String]) -> [String] {
    // Write your code here
    
    var newGrid: [[Int]]
    var bomberModels: [BomberModel] = []
    
    for (firstIndex, item) in grid.enumerated() {
        let newArray = Array(item)
        
        for (secondIndex, x) in newArray.enumerated() {
            if x == "O" {
                print("Row: \(firstIndex) Column: \(secondIndex)")
                let position = BomberPosition(x: firstIndex, y: secondIndex)
                let newBomberModel = BomberModel(positionx: position)
                bomberModels.append(newBomberModel)
            }
        }
    }
    
    for (firstIndex, item) in grid.enumerated() {
        
    }
    
    return [""]
}

bomberMan2(n: 3, grid: grid)

class Square {
    var name: String = ""
    var containsBomb: Bool = false
    var second: Int = 0
    var x: Int = 0
    var y: Int = 0
}

func bomberMan(n: Int, grid: [String]) -> [String] {
    var all: [Square] =  []
    for (rowIndex, each) in grid.enumerated() {
        let characters: [String] = each.map({ String($0) })
        for (columnIndex, character) in characters.enumerated() {
            let square = Square()
            square.name = character
            square.second = character == "0" ? 3 : 0
            square.x = columnIndex
            square.y = rowIndex
            square.containsBomb = character == "0"
            all.append(square)
        }
    }

    let row: Int = grid.first?.count ?? 0
    let column: Int = grid.count
    for second in 1...n {
        for r in 0..<row {
            for c in 0..<column {
                if let square = all.filter({ $0.x == c && $0.y == r }).first {
                    if square.containsBomb {
                        square.second -= 1
                    } else {
                        square.name = "0"
                        square.containsBomb = true
                        square.second = 3
                    }
                }
            }
        }
    }
    
    return [""]
}


