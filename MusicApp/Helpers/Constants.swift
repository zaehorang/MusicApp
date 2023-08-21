//
//  Constants.swift
//  MusicApp
//
//  Created by zaehorang on 2023/08/22.
//

import Foundation

//MARK: - Name Space 만들기

// 사용하게될 API 문자열 묶음
public struct MusicApi {
    static let requestUrl = "https://itunes.apple.com/search?"
    static let mediaParam = "media=music"
    private init() {}
}


// 사용하게될 Cell 문자열 묶음
public struct Cell {
    static let musicCellIdentifier = "MusicCell"
    static let musicCollectionViewCellIdentifier = "MusicCollectionViewCell"
    private init() {}
}



// 컬렉션뷰 구성을 위한 설정
public struct CVCell {
    static let spacingWitdh: CGFloat = 1
    static let cellColumns: CGFloat = 3
    private init() {}
}
