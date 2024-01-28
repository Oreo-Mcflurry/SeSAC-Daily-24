//
//  TableViewCell.swift
//  SeSAC-Daily24
//
//  Created by A_Mcflurry on 1/28/24.
//

import UIKit
import SnapKit

class TableViewCell: UITableViewCell {
	let label = UILabel()
	let searchImage = UIImageView()
	let deleteButton = UIButton()

	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)

		[label, searchImage, deleteButton].forEach { contentView.addSubview($0) }
		
		searchImage.image = UIImage(systemName: "magnifyingglass")
		searchImage.tintColor = .white

		deleteButton.setImage(UIImage(systemName: "xmark"), for: .normal)
		deleteButton.tintColor = .white
		searchImage.snp.makeConstraints {
			 $0.leading.equalTo(20)
			 $0.top.equalTo(10)
			 $0.bottom.equalTo(-10)
		}

		label.snp.makeConstraints {
			$0.leading.equalTo(searchImage.snp.trailing).offset(10)
			$0.trailing.greaterThanOrEqualTo(deleteButton.snp.leading)
			$0.verticalEdges.equalTo(10)
			$0.height.equalTo(searchImage.snp.height)
		}

		deleteButton.snp.makeConstraints {
			$0.trailing.equalTo(contentView.snp.trailing).offset(-20)
			$0.top.equalTo(10)
			$0.bottom.equalTo(-10)
		}
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
}
