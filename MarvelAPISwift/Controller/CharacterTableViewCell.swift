//
//  CharacterTableViewCell.swift
//  MarvelAPISwift
//
//  Created by Ramazan Ceylan on 16.01.2022.
//

import UIKit

class CharacterTableViewCell: UITableViewCell {

    @IBOutlet weak var lblCharacterName: UILabel!
    @IBOutlet weak var imgCharacter: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
