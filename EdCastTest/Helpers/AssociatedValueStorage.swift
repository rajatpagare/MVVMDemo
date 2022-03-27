//
//  AssociatedValueStorage.swift
//
//  Created by Rajat Pagare on 12/04/21.
//

import Foundation

protocol AssociatedValueStorage: AnyObject { }

extension AssociatedValueStorage {

	func writeAssociatedValue<T>(_ value: T?, key: UnsafeRawPointer) {
		AssociatedValues.writeAssociatedValue(value, to: self, key: key)
	}

	func readAssociatedValue<T>(key: UnsafeRawPointer) -> T? {
		return AssociatedValues.readAssociatedValue(from: self, key: key)
	}
}

enum AssociatedValues {

	static func writeAssociatedValue<T>(_ value: T?, to object: Any, key: UnsafeRawPointer) {
		objc_setAssociatedObject(object, key, value, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
	}

	static func readAssociatedValue<T>(from object: Any, key: UnsafeRawPointer) -> T? {
		return objc_getAssociatedObject(object, key) as? T
	}
}
