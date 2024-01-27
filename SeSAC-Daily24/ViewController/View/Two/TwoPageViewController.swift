//
//  TwoPageViewController.swift
//  SeSAC-Daily24
//
//  Created by A_Mcflurry on 1/27/24.
//

import UIKit
import SwiftUI
import SnapKit

class TwoPageViewController: UIViewController {
	var select: Int = 0 {
		didSet {
			let button = [blueButton, greenButton, pinkButton]
			button[select].backgroundColor = .white
			button[select].setTitleColor(.black, for: .normal)
			button[oldValue].backgroundColor = .black
			button[oldValue].setTitleColor(.white, for: .normal)
		}
	}

	let blueButton = TabButton(name: "공개 예정", image: "blue")
	let greenButton = TabButton(name: "모두의 인기 콘텐츠", image: "green")
	let pinkButton = TabButton(name: "Top 10 시리즈", image: "pink")
	let searchBar: UISearchBar = {
		let searchBar = UISearchBar()
		searchBar.placeholder = "게임, 시리즈, 영화를 검색하세요."
		searchBar.searchBarStyle = .minimal
		return searchBar
	}()

	let titleLabel: UILabel = {
		let label = UILabel()
		label.text = "이런! 찾으시는 작품이 없습니다"
		label.font = .boldSystemFont(ofSize: 27)
		return label
	}()

	let subtitleLabel: UILabel = {
		let label = UILabel()
		label.text = "다른 영화, 시리즈, 배우, 감독 또는 장르를 검색해 보세요."
		label.font = .systemFont(ofSize: 16)
		label.textColor = .systemGray
		return label
	}()

	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .systemBackground
		navigationItem.title = "New & Hot 검색"
		addViews()
		configureView()
		setButtons()
	}
}

extension TwoPageViewController: ConfigureView {
	func addViews() {
		[blueButton, greenButton, pinkButton, searchBar, titleLabel, subtitleLabel].forEach { view.addSubview($0) }
	}

	func configureView() {
		searchBar.snp.makeConstraints {
			$0.top.horizontalEdges.equalTo(view.safeAreaLayoutGuide)
		}

		blueButton.snp.makeConstraints {
			$0.top.equalTo(searchBar.snp.bottom).offset(10)
			$0.leading.equalTo(10)
			$0.height.equalTo(35)
			$0.width.equalTo(90)
		}

		greenButton.snp.makeConstraints {
			$0.top.equalTo(searchBar.snp.bottom).offset(10)
			$0.leading.equalTo(blueButton.snp.trailing)
			$0.height.equalTo(35)
			$0.width.equalTo(160)
		}

		pinkButton.snp.makeConstraints {
			$0.top.equalTo(searchBar.snp.bottom).offset(10)
			$0.leading.equalTo(greenButton.snp.trailing)
			$0.height.equalTo(35)
			$0.width.equalTo(120)
		}

		subtitleLabel.snp.makeConstraints {
			$0.centerX.equalTo(view.snp.centerX)
			$0.centerY.equalTo(view.snp.centerY)
		}

		titleLabel.snp.makeConstraints {
			$0.bottom.equalTo(subtitleLabel.snp.top)
			$0.centerX.equalTo(view.snp.centerX)
		}
	}

	func setButtons() {
		for (index, bt) in [blueButton, greenButton, pinkButton].enumerated() {
			bt.tag = index
			bt.addTarget(self, action: #selector(pressButton(sender:)), for: .touchUpInside)
		}
		blueButton.backgroundColor = .white
		blueButton.setTitleColor(.black, for: .normal)
	}

	@objc func pressButton(sender: UIButton) {
		select = sender.tag
	}
}

class TabButton: UIButton {
	let name: String
	let image: String

	init(name: String, image: String) {
		self.name = name
		self.image = image

		super.init(frame: .zero)
		self.setImage(UIImage(named: image), for: .normal)
		self.setTitle(name, for: .normal)
		self.titleLabel?.font = .systemFont(ofSize: 15)
		self.backgroundColor = .black
		self.setTitleColor(.white , for: .normal)
		self.layer.cornerRadius = 10
	}

	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

#Preview {
	UINavigationController(rootViewController: TwoPageViewController())
}
