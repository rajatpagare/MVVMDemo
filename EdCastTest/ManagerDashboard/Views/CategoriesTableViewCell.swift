//
//  CategoryTableViewCell.swift
//  EdCastTest
//
//  Created by Rajat Pagare on 27/03/22.
//

import UIKit

protocol CategoriesTableViewCellDelegate: AnyObject {
	func selectedCategory(category: ManagerDashboardCategoryModel)
}

class CategoriesTableViewCell: UITableViewCell, Reusable {

	@IBOutlet weak var collectionView: UICollectionView!
	private var categories: [ManagerDashboardCategoryModel] = []
	weak var delegate: CategoriesTableViewCellDelegate?

	override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
		collectionView.dataSource = self
		collectionView.delegate = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

	func setViewModel(categories: [ManagerDashboardCategoryModel]) {
		self.categories = categories
		collectionView.reloadData()
	}
}

extension CategoriesTableViewCell: UICollectionViewDataSource {
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let category = categories[indexPath.row]
		let cell = collectionView.dequeueReusableCell(for: indexPath, cellType: CategoryCollectionViewCell.self)
		cell.setViewModel(category: category)
		return cell
	}

	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return categories.count
	}
}

extension CategoriesTableViewCell: UICollectionViewDelegate {
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		let category = categories[indexPath.row]
		delegate?.selectedCategory(category: category)
	}
}
