public struct CityFinder {
    public func find(using text: String) -> [String] {
        guard text.count >= 2 else { return [] }
        
        let filteredCities = cities.filter { $0.hasPrefix(text) }

        return filteredCities
    }
}
