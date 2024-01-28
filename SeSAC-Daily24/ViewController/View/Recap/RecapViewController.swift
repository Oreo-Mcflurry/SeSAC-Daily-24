//
//  RecapViewController.swift
//  SeSAC-Daily24
//
//  Created by A_Mcflurry on 1/27/24.
//

import UIKit
import SnapKit

class RecapViewController: UIViewController {

	let searchBar: UISearchBar = {
		let searchBar = UISearchBar()
		searchBar.placeholder = "브랜드, 상품, 프로필, 태그 등"
		return searchBar
	}()

	let tableView = UITableView()

	var searchText: [String] = ["검색어 인듯"] {
		didSet {
			addViews()
		}
	}

	let emptyView: UIView = {
		let imageView = UIImageView(image: .empty)
		let label = UILabel()
		label.text = "최근 검색어가 없어요"

		let view = UIView()
		view.addSubview(imageView)
		view.addSubview(label)

		imageView.snp.makeConstraints {
			$0.top.horizontalEdges.equalTo(0)
		}
		label.snp.makeConstraints {
			$0.top.equalTo(imageView.snp.bottom).offset(20)
			$0.centerX.equalTo(view.snp.centerX)
		}
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()

	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .systemBackground
		addViews()
		configureView()
		navigationItem.title = "떠나고 싶은 고래밥님의 새싹쇼핑"
		searchBar.delegate = self
		setTableView()
	}
}

extension RecapViewController: UISearchBarDelegate {
	func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
		searchText.insert(searchBar.text!, at: 0)
		searchBar.text = ""
		tableView.reloadData()
	}
}

extension RecapViewController: ConfigureView {
	func addViews() {
		if searchText.isEmpty {
			tableView.removeFromSuperview()
			view.addSubview(emptyView)

			// 왜 이게 중앙에 위치 안하는지 도무지 이해가 안되는군요.
			emptyView.snp.makeConstraints {
				$0.centerX.equalTo(view.snp.centerX)
				$0.centerY.equalTo(view.snp.centerY).offset(-70)
			}
		} else {
			emptyView.removeFromSuperview()
			[searchBar, tableView].forEach { view.addSubview($0) }
			tableView.snp.makeConstraints {
				$0.top.equalTo(searchBar.snp.bottom)
				$0.horizontalEdges.bottom.equalToSuperview()
			}
		}
	}
	
	func configureView() {
		searchBar.snp.makeConstraints {
			$0.top.equalTo(view.safeAreaLayoutGuide)
			$0.horizontalEdges.equalTo(0)
		}
	}
}

extension RecapViewController: UITableViewDelegate, UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return searchText.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell
		cell.label.text = searchText[indexPath.row]
		cell.deleteButton.tag = indexPath.row
		cell.deleteButton.addTarget(self, action: #selector(deleteSearchHistory(sender:)), for: .touchUpInside)
		return cell
	}
	
	func setTableView() {
		tableView.dataSource = self
		tableView.delegate = self

		tableView.register(TableViewCell.self, forCellReuseIdentifier: "Cell")

		tableView.rowHeight = UITableView.automaticDimension
	}

	@objc func deleteSearchHistory(sender: UIButton) {
		searchText.remove(at: sender.tag)
		tableView.reloadData()
	}
}

#Preview {
	UINavigationController(rootViewController: RecapViewController())
}
