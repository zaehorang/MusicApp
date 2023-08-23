//
//  MusicCollectionViewCell.swift
//  MusicApp
//
//  Created by zaehorang on 2023/08/22.
//

import UIKit

class MusicCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var mainImageView: UIImageView!
    
    // 이미지 URL을 전달받는 속성
    var imageUrl: String? {
        didSet {
            loadImage()
        }
    }
    
    // URL ===> 이미지를 셋팅하는 메서드
    private func loadImage() {
        guard let urlString = self.imageUrl, let url = URL(string: urlString)  else { return }
        print(#function)
        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
                   guard let self,
                         let data = data,
                         response != nil,
                         error == nil else { return }
                   DispatchQueue.main.async {
                       self.mainImageView.image = UIImage(data: data) ?? UIImage()
                   }
               }.resume()
    }
    
    
    // 셀이 재사용되기 전에 호출되는 메서드
    override func prepareForReuse() {
        super.prepareForReuse()
        self.mainImageView.image = nil
    }
}

