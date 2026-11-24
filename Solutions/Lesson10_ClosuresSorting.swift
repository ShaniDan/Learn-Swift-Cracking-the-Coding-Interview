// Solutions for Lesson 10.
import Support

func swapPair(_ pair: (Int, Int)) -> (Int, Int) {
    let (a, b) = pair
    return (b, a)
}

func squaresOfOdds(_ nums: [Int]) -> [Int] {
    return nums.filter { $0 % 2 != 0 }.map { $0 * $0 }
}

func total(_ nums: [Int]) -> Int {
    return nums.reduce(0, +)
}

func sortByLength(_ words: [String]) -> [String] {
    return words.sorted { $0.count != $1.count ? $0.count < $1.count : $0 < $1 }
}

func rankStudents(_ students: [(name: String, grade: Int)]) -> [String] {
    return students
        .sorted { $0.grade != $1.grade ? $0.grade > $1.grade : $0.name < $1.name }
        .map { $0.name }
}

func areAnagrams(_ a: String, _ b: String) -> Bool {
    return a.lowercased().sorted() == b.lowercased().sorted()
}

func pairUp(_ keys: [String], _ values: [Int]) -> [String: Int] {
    return Dictionary(uniqueKeysWithValues: zip(keys, values))
}

func manhattanDistance(_ p: (Int, Int), _ q: (Int, Int)) -> Int {
    return abs(p.0 - q.0) + abs(p.1 - q.1)
}

func neighbors(of cell: (Int, Int), rows: Int, cols: Int) -> [[Int]] {
    let (r, c) = cell
    return [(-1, 0), (1, 0), (0, -1), (0, 1)]
        .map { [r + $0.0, c + $0.1] }
        .filter { $0[0] >= 0 && $0[0] < rows && $0[1] >= 0 && $0[1] < cols }
}

func numbersIn(_ items: [String]) -> [Int] {
    return items.compactMap { Int($0) }.sorted()
}
