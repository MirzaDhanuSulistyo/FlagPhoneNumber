//
//  FPNCountryRepository.swift
//  FlagPhoneNumber
//
//  Created by Aurelien on 21/11/2019.
//

import Foundation

open class FPNCountryRepository {

	open var locale: Locale
	open var countries: [FPNCountry] = []

	public init(locale: Locale = Locale.current) {
		self.locale = locale
		
		countries = getAllCountries()
	}

	// Populates the metadata from the included json file resource
	private func getAllCountries() -> [FPNCountry] {
		let bundle = Bundle.FlagPhoneNumber()
		// Specify the Resources subdirectory
		guard let jsonPath = bundle.path(forResource: "Resources/countryCodes", ofType: "json") else {
			print("Error: countryCodes.json not found in bundle at Resources/countryCodes.json")
			return []
		}

		guard let jsonData = try? Data(contentsOf: URL(fileURLWithPath: jsonPath)) else {
			print("Error: Failed to load data from \(jsonPath)")
			return []
		}

		var countries = [FPNCountry]()
		do {
			if let jsonObjects = try JSONSerialization.jsonObject(with: jsonData, options: .allowFragments) as? [NSDictionary] {
				for countryObj in jsonObjects {
					guard let code = countryObj["code"] as? String,
						let phoneCode = countryObj["dial_code"] as? String,
						let name = countryObj["name"] as? String else {
						continue
					}
					let country = FPNCountry(code: code, name: locale.localizedString(forRegionCode: code) ?? name, phoneCode: phoneCode)
					countries.append(country)
				}
			}
		} catch {
			print("Error parsing JSON: \(error.localizedDescription)")
		}
		
		return countries.sorted { $0.name.localizedCaseInsensitiveCompare($1.name) == .orderedAscending }
	}

	private func getAllCountries(excluding countryCodes: [FPNCountryCode]) -> [FPNCountry] {
		var allCountries = getAllCountries()

		for countryCode in countryCodes {
			allCountries.removeAll(where: { (country: FPNCountry) -> Bool in
				return country.code == countryCode
			})
		}
		return allCountries
	}

	private func getAllCountries(equalTo countryCodes: [FPNCountryCode]) -> [FPNCountry] {
		let allCountries = getAllCountries()
		var countries = [FPNCountry]()

		for countryCode in countryCodes {
			for country in allCountries {
				if country.code == countryCode {
					countries.append(country)
				}
			}
		}
		return countries
	}

	open func setup(with countryCodes: [FPNCountryCode]) {
		countries = getAllCountries(equalTo: countryCodes)
	}

	open func setup(without countryCodes: [FPNCountryCode]) {
		countries = getAllCountries(excluding: countryCodes)
	}

}
