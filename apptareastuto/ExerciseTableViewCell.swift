//
//  ExerciseTableViewCell.swift
//  apptareastuto
//
//  Created by MacAMP on 26/01/18.
//  Copyright © 2018 MacAMP. All rights reserved.
//

import UIKit

class ExerciseTableViewCell: UITableViewCell {

    @IBOutlet weak var labelCell: UILabel!
    @IBOutlet weak var labelestado: UILabel!
    
    //@IBOutlet weak var btnQuitar: UIButton!
    weak var delegate: ExerciseTableViewCellDelegate?
    var nrofila: Int = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)        

        // Configure the view for the selected state
    }
    
    func changueButon(sender: UIButton) {
        delegate?.didPressHeartButton(sender: sender)
    }
    /*
    @IBAction func quitartarea(_ sender: Any) {
        
    }*/
    @IBAction func quitarTarea(_ sender: Any) {
        print("asd \(nrofila) ")
        
        //super.index(ofAccessibilityElement: <#T##Any#>)
    }
    
}

protocol ExerciseTableViewCellDelegate: class {
    func didPressHeartButton(sender: UIButton)
}
