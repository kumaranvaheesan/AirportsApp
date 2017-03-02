//
//  MapViewCell.swift
//  Airports App
//
//  Created by kumaran V on 02/03/17.
//  Copyright © 2017 Kumaran. All rights reserved.
//

import UIKit
import MapKit
class MapViewCell: UITableViewCell {
    @IBOutlet var mapView: MKMapView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
       
    }

}
