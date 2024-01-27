//
//  ThreePageViewController.swift
//  SeSAC-Daily24
//
//  Created by A_Mcflurry on 1/27/24.
//

import UIKit
import SwiftUI
import SnapKit

class ThreePageViewController: UIViewController {

	let titleLabel: UILabel = {
		let label = UILabel()
		label.text = "'나만의 자동 저장' 기능"
		label.font = .boldSystemFont(ofSize: 20)
		return label
	}()

	let subTitleLabel: UILabel = {
		let label = UILabel()
		label.text = "취향에 맞는 영화와 시리즈를 자동으로 저장해 드립니다. 디바이스에 언제나 잭님의 과제가 깃든 PDF들을 만나보세요. 지루할 틈이 없어요"
		label.textAlignment = .center
		label.numberOfLines = 0
		label.textColor = .gray
		label.font = .boldSystemFont(ofSize: 15)
		return label
	}()

	let imageView: UIImageView = {
		let imageView = UIImageView()
		imageView.image = .dummy
		return imageView
	}()

	let settingButton: UIButton = {
		let button = UIButton()
		button.setTitle("설정하기", for: .normal)
		button.backgroundColor = .systemBlue
		button.setTitleColor(.white, for: .normal)
		button.titleLabel?.font = .boldSystemFont(ofSize: 18)
		button.layer.cornerRadius = 10
		return button
	}()

	let viewButon: UIButton = {
		let button = UIButton()
		button.setTitle("저장 가능한 콘텐츠 살펴보기", for: .normal)
		button.backgroundColor = .white
		button.setTitleColor(.black, for: .normal)
		button.titleLabel?.font = .boldSystemFont(ofSize: 18)
		button.layer.cornerRadius = 10
		return button
	}()

	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .systemBackground
		navigationItem.title = "저장한 콘텐츠 목록"
		addViews()
		configureView()
	}
}

extension ThreePageViewController: ConfigureView {
	func addViews() {
		[titleLabel, subTitleLabel, imageView, settingButton, viewButon].forEach { view.addSubview($0) }
	}

	func configureView() {
		imageView.snp.makeConstraints {
			$0.center.equalTo(view.snp.center)
		}

		subTitleLabel.snp.makeConstraints {
			$0.bottom.equalTo(imageView.snp.top)
			$0.leading.equalTo(40)
			$0.trailing.equalTo(-40)
		}

		titleLabel.snp.makeConstraints {
			$0.bottom.equalTo(subTitleLabel.snp.top).offset(-10)
			$0.centerX.equalTo(view.snp.centerX)
		}

		settingButton.snp.makeConstraints {
			$0.centerX.equalTo(view.snp.centerX)
			$0.top.equalTo(imageView.snp.bottom)
			$0.leading.equalTo(40)
			$0.trailing.equalTo(-40)
			$0.height.equalTo(40)
		}

		viewButon.snp.makeConstraints {
			$0.centerX.equalTo(view.snp.centerX)
			$0.top.equalTo(settingButton.snp.bottom).offset(20)
			$0.leading.equalTo(65)
			$0.trailing.equalTo(-65)
		}
	}
}


#Preview {
	UINavigationController(rootViewController: ThreePageViewController())
}
