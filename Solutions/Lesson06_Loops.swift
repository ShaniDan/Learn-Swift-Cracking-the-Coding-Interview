// Solutions for Lesson 06.
import Support

func sumTo(_ n: Int) -> Int {
    var total = 0
    for i in 0...max(n, 0) {
        total += i
    }
    return total
}

func factorial(_ n: Int) -> Int {
    var result = 1
    var i = 2
    while i <= n {
        result *= i
        i += 1
    }
    return result
}

func countVowels(_ s: String) -> Int {
    var count = 0
    for ch in s.lowercased() where "aeiou".contains(ch) {
        count += 1
    }
    return count
}

func reverseString(_ s: String) -> String {
    var out = ""
    for ch in s {
        out = String(ch) + out
    }
    return out
}

func countDigits(_ n: Int) -> Int {
    var n = n
    var digits = 0
    while n > 0 {
        n /= 10
        digits += 1
    }
    return digits
}

func sumOfDigits(_ n: Int) -> Int {
    var n = n
    var total = 0
    while n > 0 {
        total += n % 10
        n /= 10
    }
    return total
}

func reverseDigits(_ n: Int) -> Int {
    var n = n
    var result = 0
    while n > 0 {
        result = result * 10 + n % 10
        n /= 10
    }
    return result
}

func isPrime(_ n: Int) -> Bool {
    if n < 2 { return false }
    var d = 2
    while d * d <= n {          // only need to test up to the square root
        if n % d == 0 { return false }
        d += 1
    }
    return true
}

func isPalindrome(_ s: String) -> Bool {
    let chars = Array(s)
    for i in 0..<chars.count / 2 {
        if chars[i] != chars[chars.count - 1 - i] {
            return false
        }
    }
    return true
}
