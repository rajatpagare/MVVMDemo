//
//  CategoryCollectionViewCell.swift
//  EdCastTest
//
//  Created by Rajat Pagare on 27/03/22.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell, Reusable {
	@IBOutlet weak var titleLabel: UILabel!
	@IBOutlet weak var containerView: UIView!

	override func awakeFromNib() {
		super.awakeFromNib()
		self.viewDidInit()
	}

	private func viewDidInit() {
		titleLabel.font = .systemFont(ofSize: 14)
		containerView.layer.cornerRadius = 14
	}
	
	func setViewModel(category: ManagerDashboardCategoryModel) {
		titleLabel.text = category.category
		if category.selected {
			titleLabel.textColor = .white
			containerView.layer.borderWidth = 0
			containerView.backgroundColor = UIColor(named: "selectedCategory")
		} else {
			titleLabel.textColor = UIColor(named: "selectedCategoryBorder")
			containerView.layer.borderWidth = 1
			containerView.layer.borderColor = UIColor(named: "selectedCategoryBorder")?.cgColor
			containerView.backgroundColor = .white
		}
	}
}
