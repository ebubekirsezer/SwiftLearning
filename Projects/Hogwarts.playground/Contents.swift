import UIKit

var grid = [".X.X......X", ".X*.X.XXX.X", ".XX.X.XM...",
      "......XXXX."]

var grid2 = ["*.M", ".X."]

var luckCount = 0
"""
.X.X......X
.X*.X.XXX.X
.XX.X.XM...
......XXXX.
"""


//    .X.X......X
//    .X*.X.XXX.X
//    .XX.X.XM...
//    ......XXXX.

var result = countLuck(matrix: grid, k: 3)

func countLuck(matrix: [String], k: Int) -> String {
    // Write your code here
    
    
    var count = 0
    var currentRow = 0
    var currentColumn = 0
    for (rowIndex, element1) in matrix.enumerated() {
        
        for (columnIndex, element2) in element1.enumerated() {
            if element2 == "M" {
                print("Current Row: \(rowIndex) Current Column: \(columnIndex)")
                currentRow = rowIndex
                currentColumn = columnIndex
            }
        }
    }
    
    
    //count = move(row: currentRow, column: currentColumn, grid: matrix)
    
    print("Count \(count)")
    
    if count == k {
        return "Impressed"
    } else {
        return "Oops!"
    }
}

func move(row: Int, column: Int, grid: [String]) -> Int {
//
//    var down = false
//    var up = false
//    var left = false
//    var right = false
//
//    //print("my row: \(row) my column: \(column)")
//
//    //Down
//    for (rowIndex, element) in grid.enumerated() {
//
//        for (columnIndex, element) in element.enumerated() {
//            // 2 , 7
//            if row - 1 == rowIndex && column == columnIndex && element != "X" {
//                up = true
//                print("my row: \(row - 1) my column: \(column - 1)")
//                if element == "*" {
//                    luckCount = luckCount + 1
//                    return luckCount
//                }
//            }
//
//            if row + 1 == rowIndex && column == columnIndex && element != "X" {
//                down = true
//                print("my row: \(row - 1) my column: \(column - 1)")
//                if element == "*" {
//                    luckCount = luckCount + 1
//                    return luckCount
//                }
//            }
//
//            if column - 1 == columnIndex && row == rowIndex && element != "X" {
//                print("my row: \(row - 1) my column: \(column - 1)")
//                left = true
//                print("row: \(rowIndex) colum: \(columnIndex)")
//                if element == "*" {
//                    luckCount = luckCount + 1
//                    return luckCount
//                }
//            }
//
//            if column + 1 == columnIndex && row == rowIndex && element != "X" {
//                right = true
//                print("my row: \(row - 1) my column: \(column - 1)")
//                if element == "*" {
//                    return luckCount
//                }
//            }
//
//            if (right && up) {
//                print("right \(rowIndex) up \(columnIndex)")
//                luckCount = luckCount + 1
//                return move(row: rowIndex, column: columnIndex, grid: grid)
//            }
//
//            if (left && up) {
//                print("left \(rowIndex) up \(columnIndex)")
//                luckCount = luckCount + 1
//                return move(row: rowIndex, column: columnIndex, grid: grid)
//            }
//
//            if (right && down) {
//                print("right \(rowIndex) down \(columnIndex)")
//                luckCount = luckCount + 1
//                return move(row: rowIndex, column: columnIndex, grid: grid)
//            }
//
//            if (left && down) {
//                print("left \(rowIndex) down \(columnIndex)")
//                luckCount = luckCount + 1
//                return move(row: rowIndex, column: columnIndex, grid: grid)
//            }
//        }
//    }
//    return luckCount
    var startLocation = startLocation(grid: grid)
    
    return 0
}

func countLuck(grid: [String], k: Int) -> String {
  return ""
}
struct Point{
  var x = 0
  var y = 0
}

enum Direction{
  case right
  case left
  case down
  case up
}

func startLocation(grid: [String]) -> Point {
  for (rowIndex, element1) in grid.enumerated() {
    for (rowIndex, element) in grid.enumerated() {
      for (columnIndex, element) in element.enumerated() {
        if element == "M" {
          print("Found")
          print("Row: \(rowIndex) Column: \(columnIndex)")
          return Point(x: columnIndex, y: rowIndex)
        }
      }
    }
  }
  return Point(x: -1, y: -1)
}
//Verilen direcitona göre bir sonraki konumu verir , sağa git dersen bir ileri gider
func getPoint(point:Point ,direction:Direction , isBack:Bool? = false) -> Point{
  var stepcount = 1
  if isBack! {
    stepcount = stepcount * -1// geri doğru 1 adım gider
  }
  var nextPoint = point
  switch direction {
  case .right:
    if nextPoint.x + stepcount < grid.first!.count {
      nextPoint.x = nextPoint.x + stepcount
    }
  case .left:
    if (nextPoint.x - stepcount >= 0) {
      nextPoint.x = nextPoint.x - stepcount
    }
  case .down:
    if (nextPoint.y + stepcount < grid.count){
      nextPoint.y += stepcount
      print("upp")
    }
  case .up:
    print("....")
    if (nextPoint.y > 0){
        
      nextPoint.y = nextPoint.y - stepcount
    }
  }
  //print(nextPoint)
  return nextPoint
}
//Ağaç yoksa yol vardır varsayımı yapıldı
func isHAveAnyroad(locaiton:Point) -> Bool{
  print(locaiton)
  let pointXString = grid[locaiton.y]
  let character = Array(pointXString)
  let str = character[locaiton.x]
  print("currnet item \(str)")
  if str != "X"{
    print("true")
    return true
  }else{
    return false
  }
}
func isFindKey(locaiton:Point) -> Bool{
  print(locaiton)
  let pointXString = grid[locaiton.y]
  let character = Array(pointXString)
  let str = character[locaiton.x]
  print(str)
  if str != "*"{
    print("true")
    return true
  }else{
    return false
  }
}
func whereComeThisPoint(point:Point , beforePoint:Point)->Direction{
  let x = point.x - beforePoint.x
  let y = point.y - beforePoint.y
  if x == 1 {
    return .left
  }else if x == -1{
    return .right
  }else if y == 1{
    return .up
  }else if y == -1{
    return .down
  }
  return currentDirection
}
func isFindRoadWithDirection(position:Point,direction:Direction) -> Bool{
  var count = 0
  switch direction {
  case .left:
    count = position.x
  case .right:
    count = grid.first!.count - position.x
  case .down:
    count = grid.count - position.y
  case .up:
    count = position.y
  }
  for t in 0..<count {
    var _location = getPoint(point: position, direction: direction)
    print(_location)
    if isHAveAnyroad(locaiton: _location){
      return true
    }else{
      if t == 0 {//bir solundaki kontrol ediliyor.
        return false
      }
    }
     
  }
   
  return false
   
}
let directions:[Direction] = [.right , .left , .up , .down]
var location = Point(x: 9, y: 2)//startLocation(grid: grid)
var _location:Point = location // Current Location
print(isFindRoadWithDirection(position: _location, direction: .right))
var myDirections: [Direction] = []
var isfind = false
var asaPoints: [Point] = []
var asaPointDirections: [Direction] = []
var currentDirection: Direction = .right

for direction in directions {
    if isFindRoadWithDirection(position: location, direction: direction) {
        
        if  direction != whereComeThisPoint(point: location, beforePoint: _location) {
            myDirections.append(direction)
        }
    }
}

func personMove(direction: Direction) {
    
    let currentLocation = getPoint(point: location, direction: direction)
    
    if isHAveAnyroad(locaiton: currentLocation) {
        _location = currentLocation

        
        myDirections = []
        
        for direction in directions {
            if isHAveAnyroad(locaiton: currentLocation) {
                if isFindRoadWithDirection(position: currentLocation, direction: direction) {
                    print("Before direction: \(direction)")
                    print("After Direction: \(whereComeThisPoint(point: currentLocation, beforePoint: _location))")
                    if  direction != whereComeThisPoint(point: currentLocation, beforePoint: _location) {
                        myDirections.append(direction)
                        print(myDirections)
                    }
                }
            }
        }
        
        currentDirection = direction
        print(_location)
    }
}

var count = 0
repeat {
    count = count + 1
    if myDirections.count > 1 {
        asaPoints.append(location)
        luckCount = luckCount + 1
        for direction in myDirections {
            asaPointDirections.append(direction)
        }
        
        personMove(direction: asaPointDirections.first ?? .down)
        
        print("Asa vuruldu")
    } else {
        if myDirections.count == 0 {
                if asaPointDirections.count > 0 {
                    //asaPointDirections.removeFirst()
                    //_location = getPoint(point: asaPoints.first ?? Point(x: -1, y: -1), direction: asaPointDirections.first ?? .down)
                }
        } else {
            personMove(direction: myDirections.first ?? .down)
            print("Direction: \(myDirections.first)")
            myDirections.first
        }
    }
    
    if count == 249 {
        isfind = true
    }
} while isfind != true

print("count: \(asaPoints.count)")


print(luckCount)






//repeat
//{
//  var directionList:[Direction] = []
//  for dir in directions {
//    let isfindside = isFindRoadWithDirection(position: _location, direction: dir)
//    if isfindside{//bulunan yön varsa listeye ekle birden çok
//      directionList.append(dir)
//    }
//  }
//  directions = directions.filter({ (value) -> Bool in
//    return value != whereComeThisPoint(point: _location, beforePoint: location)
//  })
//  if directionList.count > 1 {
//    luckCount = luckCount + 1
//    print("Asa vuruldu çok 1 den fazla gidelecek yön var")
//    isfind = true
//  }else if(directions.count == 1){
//    print("1 yön bulundu")
//    isfind = true
//  }else{
//    print("Yön yok")
//  }
//  for d in directionList{
//  }
//} while isfind != true
// Write your code here


