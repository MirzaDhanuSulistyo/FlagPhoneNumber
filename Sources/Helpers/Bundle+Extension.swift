//
//  Bundle+Extension.swift
//  FlagPhoneNumber
//
//  Created by DeviOS on 07/12/2017.
//

import Foundation

public extension Bundle {

	@objc static var FlagIcons = FlagPhoneNumber()

	@objc static func FlagPhoneNumber() -> Bundle {
		let bundle = Bundle(for: FPNTextField.self)
		
		// First try to find the resource bundle
		if let path = bundle.path(forResource: "FlagPhoneNumber", ofType: "bundle") {
			return Bundle(path: path)!
		}
		
		// If not found, try to find the resources in the module bundle
		if let moduleBundle = Bundle(identifier: "com.flagphonenumber.FlagPhoneNumber") {
			return moduleBundle
		}
		
		// If all else fails, return the main bundle
		return Bundle.main
	}
}
