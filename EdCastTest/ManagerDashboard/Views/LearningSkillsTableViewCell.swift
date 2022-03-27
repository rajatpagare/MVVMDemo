//
//  LearningGoalsTableViewCell.swift
//  EdCastTest
//
//  Created by Rajat Pagare on 27/03/22.
//

import UIKit

class LearningSkillsTableViewCell: UITableViewCell, Reusable {

	@IBOutlet weak var titleLabel: UILabel!
	@IBOutlet weak var collectionViewHeightConstraint: NSLayoutConstraint!
	@IBOutlet weak var collectionView: UICollectionView!
	@IBOutlet weak var containerView: UIView!
	private var goalsOrSkils: [ManagerLearningSkillsModel] = []

	enum Constants {
		static let collectionViewCellHeight: CGFloat = 30
	}

	override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code

		// corner radius
		containerView.layer.cornerRadius = 10

		// shadow
		containerView.layer.shadowColor = UIColor.black.cgColor
		containerView.layer.shadowOffset = CGSize(width: 3, height: 3)
		containerView.layer.shadowOpacity = 0.7
		containerView.layer.shadowRadius = 4.0

		collectionView.dataSource = self
		collectionView.delegate = self
		titleLabel.font = .systemFont(ofSize: 14, weight: .semibold)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

	func setViewModel(type: LearningType, goalsOrSkills: [ManagerLearningSkillsModel]) {
		switch type {
		case .goal:
			titleLabel.text = "Top Learning Goals"
		case .skill:
			titleLabel.text = "Top Skills (Assessment)"
		}
		self.goalsOrSkils = goalsOrSkills
		collectionViewHeightConstraint.constant = CGFloat(self.goalsOrSkils.count) * Constants.collectionViewCellHeight
		collectionView.reloadData()
	}
}

extension LearningSkillsTableViewCell: UICollectionViewDataSource {
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let goalOrSkill = goalsOrSkils[indexPath.row]
		let cell = collectionView.dequeueReusableCell(for: indexPath, cellType: LearningSkillCollectionViewCell.self)
		cell.setViewModel(goalOrSkill: goalOrSkill)
		return cell
	}

	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return goalsOrSkils.count
	}
}

extension LearningSkillsTableViewCell: UICollectionViewDelegateFlowLayout {
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		return CGSize(width: collectionView.frame.size.width, height: Constants.collectionViewCellHeight)
	}
}
