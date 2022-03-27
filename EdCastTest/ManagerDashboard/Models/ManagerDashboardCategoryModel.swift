//
//  ManagerDashboardCategory.swift
//  EdCastTest
//
//  Created by Rajat Pagare on 27/03/22.
//

import Foundation

struct ManagerDashboardCategoryModel {
	let category: String
	var selected: Bool

	mutating func updateSelectedState(_ state: Bool) {
		self.selected = state
	}
}
