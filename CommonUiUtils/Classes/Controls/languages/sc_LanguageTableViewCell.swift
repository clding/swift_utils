//
//  sc_LanguageTableViewCell.swift
//  CommonUiUtils
//
//  Created by clding on 2021/5/7.
//

import UIKit

class sc_LanguageTableViewCell: UITableViewCell {
    @IBOutlet weak var checkedFlagView: UIImageView!
    @IBOutlet weak var nameView: UIView!
    @IBOutlet weak var oriNameLabel: UILabel!
    @IBOutlet weak var localizedLabel: UILabel!
    
    @IBOutlet weak var languageLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        let bundle = Bundle(for: type(of: self))
        self.checkedFlagView.image = UIImage(named: "sc_language_checked", in: bundle, compatibleWith: nil)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        checkedFlagView.isHidden = !selected
    }
    
    func loadNames(oriText: String, localizedText: String? = nil) {
        oriNameLabel.text = oriText
        languageLabel.text = oriText
        localizedLabel.text = localizedText
        
        nameView.isHidden = localizedText?.isEmpty == true
        languageLabel.isHidden = !(localizedText?.isEmpty == true)
    }
}
