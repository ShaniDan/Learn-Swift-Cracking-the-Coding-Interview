// Solutions for Lesson 04.
import Support

func add(_ a: Int, _ b: Int) -> Int {
    return a + b
}

func cube(_ n: Int) -> Int {
    return n * n * n
}

func lastDigit(of n: Int) -> Int {
    return n % 10
}

func fullName(first: String, last: String) -> String {
    return "\(first) \(last)"
}

func shout(_ text: String) -> String {
    return text.uppercased() + "!"
}

func isEven(_ n: Int) -> Bool {
    return n % 2 == 0
}

func celsiusToFahrenheit(_ celsius: Double) -> Double {
    return celsius * 9 / 5 + 32
}

func reverse(_ s: String) -> String {
    return String(s.reversed())
}

func perimeter(width: Int, height: Int? = nil) -> Int {
    let h = height ?? width
    return 2 * (width + h)
}
