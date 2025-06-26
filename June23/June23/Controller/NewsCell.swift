//
//  NewsCell.swift
//  June23
//
//  Created by Lokesh Yadav on 25/06/25.
//

import UIKit

class NewsCell: UITableViewCell {

    @IBOutlet weak var lblTextName: UILabel!
    @IBOutlet weak var lblDesc: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        imgView.layer.cornerRadius = imgView.frame.height / 2
        imgView.layer.borderWidth = 2.0
        imgView.layer.borderColor = UIColor.systemGray.cgColor
        imgView.contentMode = .scaleAspectFill
        imgView.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
      
    }
    
    func configureCell(article: Article) {
        lblTextName.text = article.title
        lblDesc.text = article.description
    }
    func setaImageNews(img: UIImage) {
        DispatchQueue.main.async {
            self.imgView.image = nil
            self.imgView.image = img

        }

    }

}
