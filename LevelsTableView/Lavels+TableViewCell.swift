//
//  Lavels+TableViewCell.swift
//  LevelsTableView
//
//  Created by soliduSystem on 04/04/23.
//

import UIKit

class Lavels_TableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        self.setUpCell()
    }

    @IBOutlet weak var btn: UIButton!
    @IBOutlet weak var lable: UILabel!
    @IBOutlet weak var imageViewLaves: UIImageView!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    override func prepareForReuse() {
        self.setUpCell()
    }
    
    private func setUpCell() -> Void {
        self.lable.text = ""
        self.imageViewLaves.image = UIImage(named: "")
        self.backgroundColor = .white
    }
    
}
