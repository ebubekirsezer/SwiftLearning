import UIKit

 let label = UILabel(frame: CGRect(x: 0, y: 0, width: 120, height: 44))
label.textAlignment = .center
label.text = "Theme Demo"

let lightTheme = LightTheme()
label.backgroundColor = lightTheme.backgroundColor
label.textColor = lightTheme.textColor

let darkTheme = DarkTheme()
label.backgroundColor = darkTheme.backgroundColor
label.textColor = darkTheme.textColor

let blueTheme = BlueTheme()
label.backgroundColor = blueTheme.backgroundColor
label.textColor = blueTheme.textColor
