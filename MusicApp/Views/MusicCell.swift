//
//  MusicCell.swift
//  MusicApp
//
//  Created by zaehorang on 2023/08/22.
//

import UIKit

class MusicCell: UITableViewCell {

    
    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var songNameLabel: UILabel!
    @IBOutlet weak var artistNameLabel: UILabel!
    @IBOutlet weak var albumNameLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    
    // 이미지 URL을 전달받는 속성
    var imageUrl: String? {
        didSet {
            loadImage()
        }
    }

    // 셀이 재사용되기 전에 호출되는 메서드
    override func prepareForReuse() {
        super.prepareForReuse()
        // 일반적으로 이미지가 바뀌는 것처럼 보이는 현상을 없애기 위해서 실행
        self.mainImageView.image = nil
    }
    
    // 스토리보드 또는 Nib으로 만들때, 사용하게 되는 생성자 코드
    override func awakeFromNib() {
        super.awakeFromNib()
        mainImageView.contentMode = .scaleToFill
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    // URL ===> 이미지를 셋팅하는 메서드
    private func loadImage() {
        guard let urlString = self.imageUrl, let url = URL(string: urlString)  else { return }
        
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
}
