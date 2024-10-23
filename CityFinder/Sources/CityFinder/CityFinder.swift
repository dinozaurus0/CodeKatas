public struct CityFinder {
    public func find(using text: String) -> [String] {
        guard text.count >= 2 else { return [] }
        
        return filterCities(for: text)
    }

    private func filterCities(for text: String) -> [String] {
        let lowercaseText = text.lowercased()

        return cities.filter { city in
            let lowercaseCity = city.lowercased()
            return lowercaseCity.contains(lowercaseText)
        }
    }
}
