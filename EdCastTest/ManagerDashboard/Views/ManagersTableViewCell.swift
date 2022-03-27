//
//  ManagerTableViewCell.swift
//  EdCastTest
//
//  Created by Rajat Pagare on 27/03/22.
//

import UIKit

class ManagersTableViewCell: UITableViewCell, Reusable {

	@IBOutlet weak var collectionView: UICollectionView!
	private var managers: [ManagerModel] = []

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
		collectionView.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

	func setViewModel(managers: [ManagerModel]) {
		self.managers = managers
		collectionView.reloadData()
	}
}

extension ManagersTableViewCell: UICollectionViewDataSource {
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let manager = managers[indexPath.row]
		let cell = collectionView.dequeueReusableCell(for: indexPath, cellType: ManagerCollectionViewCell.self)
		cell.setViewModel(manager: manager)
		return cell
	}

	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return managers.count
	}
}
