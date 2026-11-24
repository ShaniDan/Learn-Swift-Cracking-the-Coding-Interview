// Solutions for Lesson 02.
import Support

func lastDigit() -> Int {
    let n = 98765
    return n % 10
}

func withoutLastDigit() -> Int {
    let n = 98765
    return n / 10
}

func fullWeeks() -> Int {
    let days = 100
    return days / 7
}

func leftoverDays() -> Int {
    let days = 100
    return days % 7
}

func average() -> Double {
    let score1 = 80
    let score2 = 95
    let score3 = 77
    return Double(score1 + score2 + score3) / 3
}

func isBigNumberEven() -> Bool {
    let bigNumber = 123_456_789
    return bigNumber % 2 == 0
}

func twoToTheTen() -> Int {
    return 1 << 10
}

func newPrice() -> Double {
    let priceText = "19.99"
    return (Double(priceText) ?? 0) + 1.5
}
