
let someStringLiteral = "Some string literal value"

//multiline string
let multilineString = """
hellofsdffasd,
fsdafsfasdgfggadfg
gadfgddlkgşffdlskjfkasdfns,
sdafdslşkfkadsflmsdkn fasdflşsdfmasdşlmfa
"""

print(multilineString)

let singleLineString = "same"
let multiLineString = """
same
"""

// line break with \
let softWrappedQuotation = """
The White Rabbit put on his spectacles.  "Where shall I begin, \
please your Majesty?" he asked.

"Begin at the beginning," the King said gravely, "and go on \
till you come to the end; then stop."
"""

print(softWrappedQuotation)

let lineBreaks = """

start from here

"""
print(lineBreaks)

//special characters
let wiseWords = "\"Imagination is more important than knowledge\" - Einstein"
// "Imagination is more important than knowledge" - Einstein
let dollarSign = "\u{24}"        // $,  Unicode scalar U+0024
let blackHeart = "\u{2665}"      // ♥,  Unicode scalar U+2665
let sparklingHeart = "\u{1F496}" // 💖, Unicode scalar U+1F496


let threeDoubleQuotationMarks = """
Escaping the first quotation mark \"""
Escaping all three quotation marks \"\"\"
"""
print(threeDoubleQuotationMarks)

let threeMoreDoubleQuotationMarks = #"""
Here are three more double quotes: """
"""#
print(threeMoreDoubleQuotationMarks)

// initilazing empty string
var emptyString = ""
var anotherEmptyString = String()


//string mutability
var variableString = "fener"
variableString += "bahçe"
print(variableString)

//accessing characters in string
for character in variableString{
    print(character)
}

//defining character
let exclamationMark: Character = "!"

let catCharacters: [Character] = ["c","a","t"]
let catString = String(catCharacters)
print(catString)

//concatenating string and characters
let string1 = "hello"
let string2 = " there"
var welcome = string1 + string2
print(welcome)

var instruction = "look over"
instruction += string2

welcome.append(exclamationMark)

let three = """
three
"""

var badStart = """
one
two
"""

badStart += three

var goodStart = """
one
two

"""
goodStart += three

print(badStart)
print(goodStart)

//string interpolation

let multiplier = 3
print("\(multiplier)")
print(#"Write an interpolated string in Swift using \(multiplier)."#)
print(#"6 times 7 is \#(6 * 7)."#)

//unicode characters usage
let eAcute: Character = "\u{E9}"                         // é
let combinedEAcute: Character = "\u{65}\u{301}"
let enclosedEAcute: Character = "\u{E9}\u{20DD}"
let regionalIndicatorForUS: Character = "\u{1F1FA}\u{1F1F8}"

//count
var word = "hello"
print(word.count)


let greeting = "Guten Tag!"
greeting[greeting.startIndex]
// G
greeting[greeting.index(before: greeting.endIndex)]
// !
greeting[greeting.index(after: greeting.startIndex)]
// u
let index = greeting.index(greeting.startIndex, offsetBy: 7)
greeting[index]
// a

//inserting and removing
var welcome2 = "hello"
welcome2.insert(contentsOf: "!!", at: welcome2.endIndex)

welcome2.insert(contentsOf: " there", at: welcome2.index(before: welcome2.endIndex))
 
welcome2.remove(at: welcome2.index(before: welcome2.endIndex))

let range = welcome2.index(welcome2.endIndex, offsetBy: -6)..<welcome2.endIndex
welcome2.removeSubrange(range)


//substring
let greetings = "hello, world!"
let myIndex = greetings.firstIndex(of: ",") ?? greetings.endIndex
print(myIndex)
let beginnig = greetings[..<myIndex]

let newString = String(beginnig)

//string comparing
let aString = "aaa"
let aaString = "aaa"

if aString == aaString {
    print("equal")
}

//suffix and prefix

let romeoAndJuliet = [
    "Act 1 Scene 1: Verona, A public place",
    "Act 1 Scene 2: Capulet's mansion",
    "Act 1 Scene 3: A room in Capulet's mansion",
    "Act 1 Scene 4: A street outside Capulet's mansion",
    "Act 1 Scene 5: The Great Hall in Capulet's mansion",
    "Act 2 Scene 1: Outside Capulet's mansion",
    "Act 2 Scene 2: Capulet's orchard",
    "Act 2 Scene 3: Outside Friar Lawrence's cell",
    "Act 2 Scene 4: A street in Verona",
    "Act 2 Scene 5: Capulet's mansion",
    "Act 2 Scene 6: Friar Lawrence's cell"
]

var act1SceneCount = 0
for scene in romeoAndJuliet {
    if scene.hasPrefix("Act 1 ") {
        act1SceneCount += 1
    }
}
print("There are \(act1SceneCount) scenes in Act 1")


var mansionCount = 0
var cellCount = 0
for scene in romeoAndJuliet {
    if scene.hasSuffix("Capulet's mansion") {
        mansionCount += 1
    } else if scene.hasSuffix("Friar Lawrence's cell") {
        cellCount += 1
    }
}
print("\(mansionCount) mansion scenes; \(cellCount) cell scenes")
