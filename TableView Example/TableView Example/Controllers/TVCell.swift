//
//  TVCell.swift
//  TableView Example
//
//  Created by BERAT ALTUNTAŞ on 21.03.2022.
//

import UIKit

class TVCell: UITableViewCell {

    
    @IBOutlet weak var itemStepper: UIStepper!
    @IBOutlet var cellItemCount: UILabel!
    @IBOutlet var cellItemSubtitle: UILabel!
    @IBOutlet var cellItemTitle: UILabel!
    @IBOutlet var cellImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func itemCountStepperVC(_ sender: UIStepper) {
        let suf = cellItemCount.text?.suffix(2)
        guard let num = Int(suf!.trimmingCharacters(in: CharacterSet.whitespaces )) else {return}
        
        cellItemCount.text = "Adet: \(Int(sender.value))"
        
    }
}
