//
//  LearningSkillCollectionViewCell.swift
//  EdCastTest
//
//  Created by Rajat Pagare on 27/03/22.
//

import UIKit

class LearningSkillCollectionViewCell: UICollectionViewCell, Reusable {
    
	@IBOutlet weak var titleLabel: UILabel!
	@IBOutlet weak var descriptionLabel: UILabel!

	override func awakeFromNib() {
		super.awakeFromNib()
		self.viewDidInit()
	}

	private func viewDidInit() {
		titleLabel.font = .systemFont(ofSize: 14)
		descriptionLabel.font = .systemFont(ofSize: 14)
	}
	
	func setViewModel(goalOrSkill: ManagerLearningSkillsModel) {
		titleLabel.text = goalOrSkill.title
		descriptionLabel.text = "\(goalOrSkill.count)"
	}
}
