// Solutions for Lesson 05.
import Support

func sign(_ n: Int) -> String {
    if n > 0 {
        return "positive"
    } else if n < 0 {
        return "negative"
    }
    return "zero"
}

func maxOfThree(_ a: Int, _ b: Int, _ c: Int) -> Int {
    var biggest = a
    if b > biggest { biggest = b }
    if c > biggest { biggest = c }
    return biggest
}

func isLeapYear(_ year: Int) -> Bool {
    return year % 4 == 0 && (year % 100 != 0 || year % 400 == 0)
}

func fizzBuzz(_ n: Int) -> String {
    if n % 15 == 0 { return "FizzBuzz" }
    if n % 3 == 0 { return "Fizz" }
    if n % 5 == 0 { return "Buzz" }
    return String(n)
}

func ticketPrice(age: Int) -> Int {
    switch age {
    case ..<3: return 0
    case 3...12: return 5
    case 13...64: return 12
    default: return 7
    }
}

func isVowel(_ ch: Character) -> Bool {
    switch ch.lowercased() {
    case "a", "e", "i", "o", "u": return true
    default: return false
    }
}

func sameLength(_ a: String, _ b: String) -> Bool {
    return a.count == b.count
}
