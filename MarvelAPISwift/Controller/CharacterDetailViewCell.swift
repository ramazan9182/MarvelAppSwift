//
//  CharacterDetailViewCell.swift
//  MarvelAPISwift
//
//  Created by Ramazan Ceylan on 17.01.2022.
//

import UIKit

class CharacterDetailViewCell: UITableViewCell {

    @IBOutlet weak var imgCommics: UIImageView!
    @IBOutlet weak var lblCharComTitle: UILabel!
    @IBOutlet weak var lblCharaterDetail: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
