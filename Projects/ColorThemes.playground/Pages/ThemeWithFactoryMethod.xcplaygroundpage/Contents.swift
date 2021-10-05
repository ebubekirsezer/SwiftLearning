import UIKit

 let label = UILabel(frame: CGRect(x: 0, y: 0, width: 120, height: 44))
label.textAlignment = .center
label.text = "Theme Demo"

let lightTheme = MyThemeCreator.makeTheme(profile: .light)
label.backgroundColor = lightTheme.backgroundColor
label.textColor = lightTheme.textColor

let darkTheme = MyThemeCreator.makeTheme(profile: .dark)
label.backgroundColor = darkTheme.backgroundColor
label.textColor = darkTheme.textColor
 
let blueTheme = MyThemeCreator.makeTheme(profile: .blue)
label.backgroundColor = blueTheme.backgroundColor
label.textColor = blueTheme.textColor

let monoTheme = MyThemeCreator.makeTheme(profile: .mono)
label.backgroundColor = monoTheme.backgroundColor
label.textColor = monoTheme.textColor
