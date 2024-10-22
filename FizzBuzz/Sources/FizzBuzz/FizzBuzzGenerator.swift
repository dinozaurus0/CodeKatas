public struct FizzBuzzGenerator {
    public init() {}

    public func generate(value: Int) -> String {
        var result: String = ""
        
        if isMultipleOfThree(value) {
            result += "fizz"
        }

        if isMultipleOfFive(value) {
            result += "buzz"
        }

        return result.isEmpty ? String(value) : result
    }

    private func isMultipleOfThree(_ value: Int) -> Bool {
        value % 3 == 0
    }

    private func isMultipleOfFive(_ value: Int) -> Bool {
        value % 5 == 0
    }
}
