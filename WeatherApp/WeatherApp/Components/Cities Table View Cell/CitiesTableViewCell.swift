//
//  CitiesTableViewCell.swift
//  WeatherApp
//
//  Created by Pick Jobs on 8/29/20.
//  Copyright © 2020 Pick Jobs. All rights reserved.
//

import UIKit

class CitiesTableViewCell: UITableViewCell {
    
    //MARK: - Outlet Connections -
    @IBOutlet var cityLabel: UILabel!
    @IBOutlet var countryLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
