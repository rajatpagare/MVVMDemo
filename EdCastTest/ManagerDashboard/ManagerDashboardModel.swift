//
//  ManagerDashboardModel.swift
//  EdCastTest
//
//  Created by Rajat Pagare on 27/03/22.
//

import Foundation

protocol ManagerDashboardModel {
	var categories: [ManagerDashboardCategoryModel] { get }
	var managers: [ManagerModel] { get }
	var summaries: [ManagerSummaryModel] { get }
	var goals: [ManagerLearningSkillsModel] { get }
	var skills: [ManagerLearningSkillsModel] { get }
}
