//
//  ManagerDashboardViewController.swift
//  EdCastTest
//
//  Created by Rajat Pagare on 27/03/22.
//

import UIKit

class ManagerDashboardViewController: UIViewController {

	@IBOutlet weak var tableView: UITableView!
	let viewModel = ManagerDashboardViewModel()
	
	//	let viewModel: ManagerDashboardView
    override func viewDidLoad() {
        super.viewDidLoad()
		self.title = "Manager Dashboard"
		tableView.rowHeight = UITableView.automaticDimension
		self.tableView.estimatedRowHeight = 44.0
    }
}

extension ManagerDashboardViewController: UITableViewDataSource {
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let dashboardSection = viewModel.dashboardSections[indexPath.section]
		switch dashboardSection {
		case .manager(let managers):
			let cell = tableView.dequeueReusableCell(for: indexPath, cellType: ManagersTableViewCell.self)
			cell.setViewModel(managers: managers)
			return cell
		case .managerSkill(let skills):
			let cell = tableView.dequeueReusableCell(for: indexPath, cellType: LearningSkillsTableViewCell.self)
			cell.setViewModel(type: .skill, goalsOrSkills: skills)
			return cell
		case .category(let categories):
			let cell = tableView.dequeueReusableCell(for: indexPath, cellType: CategoriesTableViewCell.self)
			cell.setViewModel(categories: categories)
			cell.delegate = self
			return cell
		case .managerLearningGoal(let goals):
			let cell = tableView.dequeueReusableCell(for: indexPath, cellType: LearningSkillsTableViewCell.self)
			cell.setViewModel(type: .goal, goalsOrSkills: goals)
			return cell
		case .managerSummary(let summaries):
			let cell = tableView.dequeueReusableCell(for: indexPath, cellType: SummariesTableViewCell.self)
			cell.setViewModel(summaries: summaries)
			return cell
		}
	}

	func numberOfSections(in tableView: UITableView) -> Int {
		viewModel.dashboardSections.count
	}

	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 1
	}
}

extension ManagerDashboardViewController: CategoriesTableViewCellDelegate {
	func selectedCategory(category: ManagerDashboardCategoryModel) {
		viewModel.updateSelectedCategory(selectedCategory: category) { result in
			switch result {
			case .success(let sectionToBeUpdated):
				tableView.reloadSections(IndexSet(integer: sectionToBeUpdated), with: .automatic)
			case .failure:
				break
			}
		}
	}
}
