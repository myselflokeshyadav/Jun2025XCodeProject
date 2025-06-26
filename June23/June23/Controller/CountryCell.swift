//
//  CountryCell.swift
//  June23
//
//  Created by Lokesh Yadav on 23/06/25.
//

import UIKit

class CountryCell: UITableViewCell {

    @IBOutlet weak var lbltext: UILabel!
    @IBOutlet weak var lbladress: UILabel!
    @IBOutlet weak var lblloc: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func configureCell(user:User) {
        lbltext.text = user.name
        lbladress.text = user.address?.city
        lblloc.text = "\(user.address?.geo?.lat ?? "0.0"), \(user.address?.geo?.lng ?? "0.0")"
    }
    

}
