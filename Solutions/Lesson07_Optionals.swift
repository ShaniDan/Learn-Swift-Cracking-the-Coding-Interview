// Solutions for Lesson 07.
import Support

func parseInt(_ text: String) -> Int {
    return Int(text) ?? 0
}

func safeDivide(_ a: Int, _ b: Int) -> Double? {
    if b == 0 { return nil }
    return Double(a) / Double(b)
}

func hello(_ name: String?) -> String {
    guard let name else { return "Hello, stranger!" }
    return "Hello, \(name)!"
}

func lengthOf(_ s: String?) -> Int {
    return s?.count ?? 0
}

func firstEven(_ nums: [Int]) -> Int? {
    for n in nums where n % 2 == 0 {
        return n
    }
    return nil
}

func firstRepeatedChar(_ s: String) -> Character? {
    let chars = Array(s)
    for i in 0..<chars.count {
        for j in (i + 1)..<chars.count where chars[i] == chars[j] {
            return chars[i]
        }
    }
    return nil
}

func sumOfPresent(_ values: [Int?]) -> Int {
    var total = 0
    for value in values {
        if let value { total += value }
    }
    return total
}

func minutes(from text: String) -> Int? {
    let parts = text.split(separator: ":")
    guard parts.count == 2, let h = Int(parts[0]), let m = Int(parts[1]) else { return nil }
    return h * 60 + m
}
