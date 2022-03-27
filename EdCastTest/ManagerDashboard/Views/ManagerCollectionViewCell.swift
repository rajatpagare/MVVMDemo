//
//  ManagerCollectionViewCell.swift
//  EdCastTest
//
//  Created by Rajat Pagare on 27/03/22.
//

import UIKit

class ManagerCollectionViewCell: UICollectionViewCell, Reusable {

	@IBOutlet weak var imageContainerView: UIView!
	@IBOutlet weak var profileImageView: UIImageView!
	@IBOutlet weak var nameLabel: UILabel!

	override func awakeFromNib() {
		super.awakeFromNib()
		self.viewDidInit()
	}

	private func viewDidInit() {
		nameLabel.font = .systemFont(ofSize: 14)
		profileImageView.layer.cornerRadius = 20
	}

	func setViewModel(manager: ManagerModel) {
		nameLabel.text = "\(manager.firstName)\n\(manager.lastName)"
		if manager.selected {
			imageContainerView.layer.cornerRadius = 23
			imageContainerView.layer.borderWidth = 1
			imageContainerView.layer.borderColor = UIColor(named: "selectedCategory")?.cgColor
		} else {
			imageContainerView.layer.borderWidth = 0
		}
		ImageDownloader.shared.downloadImage(with: manager.profileImageURL?.absoluteString, completionHandler: { [weak self] image, _ in
			guard let image = image,
			let self = self else { return }
			self.profileImageView.image = image
		}, placeholderImage: UIImage(named: "userPlaceholder"))
	}
}
