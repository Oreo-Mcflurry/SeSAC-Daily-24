//
//  OnePageViewController.swift
//  SeSAC-Daily24
//
//  Created by A_Mcflurry on 1/27/24.
//

import UIKit
import SwiftUI
import SnapKit

class OnePageViewController: UIViewController {

	let backGroundImage: UIImageView = {
		let imageView = UIImageView(image: .background)
		imageView.contentMode = .scaleToFill
		imageView.translatesAutoresizingMaskIntoConstraints = false
		return imageView
	}()

	let hostingController: UIHostingController = {
		let hostingController = UIHostingController(rootView: MySwiftUIView())
		hostingController.view.translatesAutoresizingMaskIntoConstraints = false
		return hostingController
	}()

	let label: UILabel = {
		let label = UILabel()
		label.text = "지금 뜨는 콘텐츠"
		label.translatesAutoresizingMaskIntoConstraints = false
		return label
	}()

	let movieImage: UIImageView = {
		let image = UIImageView(image: UIImage(named: ImageEnum.getRandomImage()))
		image.contentMode = .scaleAspectFit
		image.clipsToBounds = true
		image.layer.cornerRadius = 10
		return image
	}()

	let movieImage2: UIImageView = {
		let image = UIImageView(image: UIImage(named: ImageEnum.getRandomImage()))
		image.contentMode = .scaleAspectFit
		image.clipsToBounds = true
		image.layer.cornerRadius = 10
		return image
	}()

	let movieImage3: UIImageView = {
		let image = UIImageView(image: UIImage(named: ImageEnum.getRandomImage()))
		image.contentMode = .scaleAspectFit
		image.clipsToBounds = true
		image.layer.cornerRadius = 10
		return image
	}()

	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .systemBackground
		navigationItem.title = "고래밥님"

		addViews()
		configureView()
	}
}

extension OnePageViewController: ConfigureView {
	func addViews() {
		view.addSubview(backGroundImage)
		view.addSubview(label)
		addChild(hostingController)
		view.addSubview(hostingController.view)
		view.addSubview(movieImage)
		view.addSubview(movieImage2)
		view.addSubview(movieImage3)
	}

	func configureView() {
		backGroundImage.snp.makeConstraints {
			$0.edges.equalToSuperview()
		}

		hostingController.view.snp.makeConstraints {
			$0.leading.equalTo(20)
			$0.trailing.equalTo(-20)
		}

		label.snp.makeConstraints {
			$0.top.equalTo(hostingController.view.snp.bottom).offset(10)
			$0.leading.equalTo(10)
		}

		movieImage.snp.makeConstraints {
			$0.leading.equalTo(20)
			$0.top.equalTo(label.snp.bottom).offset(10)
			$0.width.equalTo((UIScreen.main.bounds.width-20*4)/3)
			$0.height.equalTo((UIScreen.main.bounds.width-20*4)/3/2*3)
		}

		movieImage2.snp.makeConstraints {
			$0.centerX.equalTo(view.snp.centerX)
			$0.top.equalTo(label.snp.bottom).offset(10)
			$0.width.equalTo((UIScreen.main.bounds.width-20*4)/3)
			$0.height.equalTo((UIScreen.main.bounds.width-20*4)/3/2*3)
		}


		movieImage3.snp.makeConstraints {
			$0.trailing.equalTo(-20)
			$0.top.equalTo(label.snp.bottom).offset(10)
			$0.width.equalTo((UIScreen.main.bounds.width-20*4)/3)
			$0.height.equalTo((UIScreen.main.bounds.width-20*4)/3/2*3)
		}
	}
}

#Preview {
	UINavigationController(rootViewController: OnePageViewController())
}

struct MySwiftUIView: View {
	var body: some View {
		ZStack {
			Image(ImageEnum.getRandomImage())
				.resizable()
				.aspectRatio(contentMode: .fit)
				.clipShape(RoundedRectangle(cornerRadius: 15))
			VStack {
				Text("응원하고픈 · 흥미진진 · 사극 · 전투 · 한국 작품")
				buttonView
			}
			.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
		}
		.background(.clear)
	}

	private var buttonView: some View {
		HStack {
			Button {

			} label: {
				Rectangle()
					.foregroundStyle(.white)
					.frame(height: 35)
					.clipShape(RoundedRectangle(cornerRadius: 10))
					.overlay {
						Label(
							title: { Text("재생") },
							icon: { Image(systemName: "play.fill") }
						)
						.foregroundStyle(.black)
					}
			}
			.padding([.bottom, .leading])

			Button {

			} label: {
				Rectangle()
					.foregroundStyle(.black)
					.frame(height: 35)
					.clipShape(RoundedRectangle(cornerRadius: 10))
					.overlay {
						Label(
							title: { Text("내가 찜한 리스트") },
							icon: { Image(systemName: "plus") }
						)
						.foregroundStyle(.white)
					}
			}
			.padding([.bottom, .trailing])
		}
		.font(.callout)
	}
}


// 이런식으로 하니까 뷰끼리의 관계를 맞출 수 없네요.
//	func setBackGroundView() {
//		let backGroundImage: UIImageView = {
//			let imageView = UIImageView(image: .background)
//			imageView.contentMode = .scaleToFill
//			imageView.translatesAutoresizingMaskIntoConstraints = false
//			return imageView
//		}()
//		view.addSubview(backGroundImage)
//		backGroundImage.snp.makeConstraints {
//			$0.edges.equalToSuperview()
//		}
//	}
//
//	func setTitleMovieView() {
//
//		let hostingController = UIHostingController(rootView: swiftUIView)
//		hostingController.view.translatesAutoresizingMaskIntoConstraints = false
//		addChild(hostingController)
//		view.addSubview(hostingController.view)
//		hostingController.view.snp.makeConstraints {
//			$0.leading.equalTo(20)
//			$0.trailing.equalTo(-20)
//		}
//	}
//
//	func setLabel() {
//
//		view.addSubview(label)
//		label.snp.makeConstraints {
//			$0.top.equalTo()
//		}
//	}
