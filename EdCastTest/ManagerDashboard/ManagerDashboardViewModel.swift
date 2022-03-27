//
//  ManagerDashboardViewModel.swift
//  EdCastTest
//
//  Created by Rajat Pagare on 27/03/22.
//

import Foundation
import UIKit

class ManagerDashboardViewModel: ManagerDashboardModel {
	var categories: [ManagerDashboardCategoryModel] {
		get {
			return AssociatedValues.readAssociatedValue(from: self, key: &ManagerDashboardViewModelKeys.CategoriesKey) ?? []
		}
		set {
			AssociatedValues.writeAssociatedValue(newValue, to: self, key: &ManagerDashboardViewModelKeys.CategoriesKey)
		}
	}

	init() {
		categories = [ManagerDashboardCategoryModel(category: "Overview", selected: true),
					  ManagerDashboardCategoryModel(category: "Learning Plan", selected: false),
					  ManagerDashboardCategoryModel(category: "Assignments", selected: false),
					  ManagerDashboardCategoryModel(category: "Learning", selected: false)]
	}

	var managers: [ManagerModel] {
		return [ManagerModel(firstName: "Ashutosh", lastName: "Upadhyay", profileImageURL: URL(string: "https://cdn.britannica.com/68/178268-050-5B4E7FB6/Tom-Cruise-2013.jpg"), selected: true),
				ManagerModel(firstName: "Semina", lastName: "Croft", profileImageURL: URL(string: "https://media1.popsugar-assets.com/files/thumbor/r82SRROYhy6sIFuHmSdq_q_Kio8/413x72:2216x1875/fit-in/500x500/filters:format_auto-!!-:strip_icc-!!-/2020/06/18/943/n/1922398/6c31632d5eebdeb9cb6252.86135421_/i/Jennifer-Lawrence.jpg"), selected: false),
				ManagerModel(firstName: "Daichi", lastName: "Lee", profileImageURL: URL(string: "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/ilPBHd3r3ahlipNQtjr4E3G04jJ.jpg"), selected: false),
				ManagerModel(firstName: "Monika", lastName: "Kent", profileImageURL: URL(string: "https://www.watchesandculture.org/forum/wp-content/uploads/2017/10/Kate-Winslet-b-1240x840.jpg"), selected: false)]
	}

	var summaries: [ManagerSummaryModel] {
		return [ManagerSummaryModel(title: "Overall Activity", description: "44"),
				ManagerSummaryModel(title: "Cards Completed", description: "25"),
				ManagerSummaryModel(title: "Cards Contributed", description: "5"),
				ManagerSummaryModel(title: "Points scored", description: "1200"),
				ManagerSummaryModel(title: "Learning Hours", description: "86h 26m"),
				ManagerSummaryModel(title: "Assignments Overdue", description: "19"),
				ManagerSummaryModel(title: "Cards Shared", description: "22"),
				ManagerSummaryModel(title: "Active Users", description: "3")]
	}

	var goals: [ManagerLearningSkillsModel] {
		return [ManagerLearningSkillsModel(title: "Leadership", count: 2),
				ManagerLearningSkillsModel(title: "Product Management", count: 1),
				ManagerLearningSkillsModel(title: "Statistics", count: 3),
				ManagerLearningSkillsModel(title: "Mobile Learning", count: 1)]
	}

	var skills: [ManagerLearningSkillsModel] {
		return [ManagerLearningSkillsModel(title: "Leadership", count: 1),
				ManagerLearningSkillsModel(title: "Product Management", count: 1),
				ManagerLearningSkillsModel(title: "Statistics", count: 1),
				ManagerLearningSkillsModel(title: "Mobile Learning", count: 1)]
	}

	var dashboardSections: [ManagerDashboardSections] {
		return [.category(categories: categories),
				.manager(managers: managers),
				.managerSummary(summaries: summaries),
				.managerLearningGoal(goals: goals),
				.managerSkill(skills: skills)]
	}

	func updateSelectedCategory(selectedCategory: ManagerDashboardCategoryModel,
								completion: (Result<Int, Error>) -> ()) {
		let categories: [ManagerDashboardCategoryModel] = self.categories.map { category in
			let selected = category.category == selectedCategory.category
			return ManagerDashboardCategoryModel(category: category.category, selected: selected)
		}
		self.categories = categories
		if let sectionToBeUpdated = dashboardSections.firstIndex(where: { $0 == .category(categories: self.categories)}) {
			completion(.success(sectionToBeUpdated))
		} else {
			completion(.failure(ManagerDashboardError.invalidIndex))
		}
	}
}

private enum ManagerDashboardViewModelKeys {
	static var CategoriesKey = "CategoriesKey"
}

enum ManagerDashboardError: Error {
	case invalidIndex
}
