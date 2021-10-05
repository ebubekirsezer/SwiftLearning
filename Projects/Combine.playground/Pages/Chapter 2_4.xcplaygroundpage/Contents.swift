
import Foundation
import Combine
import UIKit
import SwiftUI

[1, 5, 9]
    .publisher
    .sink{ print($0) }

let label = UILabel()

Just("Ebubekir")
    .map( { "My name is \($0)" } )
    .assign(to: \.text, on: label)
