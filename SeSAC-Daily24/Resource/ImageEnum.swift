//
//  ImageEnum.swift
//  SeSAC-Daily24
//
//  Created by A_Mcflurry on 1/27/24.
//

import Foundation

enum ImageEnum: String, CaseIterable {
	case one = "1"
	case two = "2"
	case three = "3"
	case four = "4"
	case five = "5"
	case extremeJob = "극한직업"
	case thieves = "도둑들"
	case roaringCurrents = "명량"
	case veteran = "베테랑"
	case trainToBusan = "부산행"
	case alongWithTheGods1 = "신과함께인과연"
	case alongWithTheGods2 = "신과함께죄와벌"
	case avatar = "아바타"
	case aladdin = "알라딘"
	case assassination = "암살"
	case avengersEndgame = "어벤져스엔드게임"
	case theManFromNowhere = "왕의남자"
	case theTaxiDriver = "택시운전사"
	case haeundae = "해운대"

	static func getRandomImage() -> String {
		return ImageEnum.allCases.randomElement()?.rawValue ?? "1"
	}
}
