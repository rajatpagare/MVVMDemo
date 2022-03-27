//
//  SummaryCollectionViewCell.swift
//  EdCastTest
//
//  Created by Rajat Pagare on 27/03/22.
//

import UIKit

class SummaryCollectionViewCell: UICollectionViewCell, Reusable {
    
	@IBOutlet weak var descriptionLabel: UILabel!
	@IBOutlet weak var containerView: UIView!
	@IBOutlet weak var titleLabel: UILabel!

	override func awakeFromNib() {
		super.awakeFromNib()
		self.viewDidInit()
	}

	private func viewDidInit() {
		containerView.layer.cornerRadius = 5
		containerView.layer.borderWidth = 1
		containerView.layer.borderColor = UIColor(named: "selectedCategoryBorder")?.cgColor
		titleLabel.textColor = UIColor(named: "selectedCategoryBorder")
		titleLabel.font = .systemFont(ofSize: 14)
		descriptionLabel.textColor = .black
		descriptionLabel.font = .systemFont(ofSize: 20, weight: .semibold)
	}

	func setViewModel(summary: ManagerSummaryModel) {
		titleLabel.text = summary.title
		descriptionLabel.text = summary.description
	}
}
