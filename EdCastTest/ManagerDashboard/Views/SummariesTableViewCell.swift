//
//  SummariesTableViewCell.swift
//  EdCastTest
//
//  Created by Rajat Pagare on 27/03/22.
//

import UIKit

class SummariesTableViewCell: UITableViewCell, Reusable {

	@IBOutlet weak var collectionViewHeightConstraint: NSLayoutConstraint!
	@IBOutlet weak var collectionView: UICollectionView!
	@IBOutlet weak var summaryLabel: UILabel!
	private var summaries: [ManagerSummaryModel] = []

	enum Constants {
		static let collectionViewCellHeight: CGFloat = 100
		static let margin: CGFloat = 8
	}
	override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
		collectionView.dataSource = self
		collectionView.delegate = self
		summaryLabel.text = "Summary of Abhishek's Team"
		summaryLabel.textColor = UIColor(named: "selectedCategoryBorder")
		summaryLabel.font = .systemFont(ofSize: 14)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

	func setViewModel(summaries: [ManagerSummaryModel]) {
		self.summaries = summaries
		let halfOfTotalCells = (Double(summaries.count) / 2).rounded(.up)
		collectionViewHeightConstraint.constant = CGFloat(halfOfTotalCells * Constants.collectionViewCellHeight) + (halfOfTotalCells * Constants.margin)
		collectionView.reloadData()
	}
}

extension SummariesTableViewCell: UICollectionViewDataSource {
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let summary = summaries[indexPath.row]
		let cell = collectionView.dequeueReusableCell(for: indexPath, cellType: SummaryCollectionViewCell.self)
		cell.setViewModel(summary: summary)
		return cell
	}

	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return summaries.count
	}
}

extension SummariesTableViewCell: UICollectionViewDelegateFlowLayout {
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		return CGSize(width: collectionView.frame.size.width / 2 - Constants.margin, height: Constants.collectionViewCellHeight)
	}
}
