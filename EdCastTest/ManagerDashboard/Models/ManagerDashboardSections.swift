//
//  ManagerDashboardSections.swift
//  EdCastTest
//
//  Created by Rajat Pagare on 27/03/22.
//

import Foundation

enum ManagerDashboardSections: Equatable {
	static func == (lhs: ManagerDashboardSections, rhs: ManagerDashboardSections) -> Bool {
		switch(lhs, rhs) {
		case (let .category(lhsCategories), let .category(rhsCategories)):
			return lhsCategories.count == rhsCategories.count
		default:
			return false
		}
	}

	case category(categories: [ManagerDashboardCategoryModel])
	case manager(managers: [ManagerModel])
	case managerSummary(summaries: [ManagerSummaryModel])
	case managerLearningGoal(goals: [ManagerLearningSkillsModel])
	case managerSkill(skills: [ManagerLearningSkillsModel])
}

enum LearningType {
	case goal
	case skill
}
