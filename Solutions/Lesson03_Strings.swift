// Solutions for Lesson 03.
import Support

let text = "Cracking the Coding Interview"

func firstChar() -> Character {
    return text.first!
}

func lastChar() -> Character {
    return text.last!
}

func firstWord() -> String {
    return String(text.prefix(8))
}

func reversedText() -> String {
    return String(text.reversed())
}

func lowercaseText() -> String {
    return text.lowercased()
}

func countI() -> Int {
    return text.filter { $0 == "i" }.count
}

func words() -> [String] {
    return text.split(separator: " ").map { String($0) }
}

func urlified() -> String {
    return text.replacing(" ", with: "%20")
}

func hasCoding() -> Bool {
    return text.contains("Coding")
}

func letterPosition() -> Int {
    let letter: Character = "c"
    return Int(letter.asciiValue! - Character("a").asciiValue!)
}

func characterAtNine() -> Character {
    return Array(text)[9]
}
