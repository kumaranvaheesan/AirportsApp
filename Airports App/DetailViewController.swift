//
//  DetailViewController.swift
//  Airports App
//
//  Created by kumaran V on 02/03/17.
//  Copyright © 2017 Kumaran. All rights reserved.
//

import UIKit
import MapKit
class DetailViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView!
    var airport: Airport?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = airport?.display_name
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table View
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 8
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if(indexPath.section == 0){
            var cell = tableView.dequeueReusableCell(withIdentifier: "CustomMapCell")! as! MapViewCell
            if cell == nil {
                tableView.register(UINib(nibName: "CustomMapCell", bundle: nil), forCellReuseIdentifier: "CustomMapCell")
                cell = tableView.dequeueReusableCell(withIdentifier: "CustomMapCell") as! MapViewCell!
                
            }
            let myAnnotation: MKPointAnnotation = MKPointAnnotation()
            myAnnotation.coordinate = CLLocationCoordinate2DMake((airport?.latitude)!, (airport?.longitude)!);
            myAnnotation.title = airport?.display_name
            
            let center = myAnnotation.coordinate
            let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
            
            cell.mapView.setRegion(region, animated: true)
            cell.mapView.addAnnotation(myAnnotation)
            
            return cell
        }
        else if( indexPath.section == 1)
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTitleCell", for: indexPath)
            cell.textLabel!.text = airport?.display_name
            return cell
        }
        else if( indexPath.section == 2)
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTitleCell", for: indexPath)
            cell.textLabel!.text = airport?.code
            return cell
        }
        else if( indexPath.section == 3)
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTitleCell", for: indexPath)
            cell.textLabel!.text = airport?.country
            return cell
        }
        else if(indexPath.section == 4)
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTitleCell", for: indexPath)
            cell.textLabel!.text = airport?.currency_code
            return cell
        }
        else if(indexPath.section == 5)
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTitleCell", for: indexPath)
            cell.textLabel!.text = airport?.timezone
            return cell
        }
        else if(indexPath.section == 6)
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTitleCell", for: indexPath)
            cell.textLabel!.text =   (airport?.international_airport)! ? "YES" : "NO"
            
            return cell
        }
        else
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTitleCell", for: indexPath)
            cell.textLabel!.text =  (airport?.regional_airport)! ? "YES" : "NO"
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        if(indexPath.section == 0)
        {
            return 200.0;
        }
        else{
            return 44.0;
        }
    }
    
    func tableView(_ tableView : UITableView,  titleForHeaderInSection section: Int)->String? {
        switch(section) {
        case 1:return "Airport Name"
        case 2:return "Airport Code"
        case 3:return "Country"
        case 4:return "Currency Code"
        case 5:return "Timezone"
        case 6:return "International Airport"
        case 7:return "Regional Airport"
        default :return ""
            
        }
    }
    
    private func tableView (_ tableView:UITableView , heightForHeaderInSection section:Int)->Float
    {
        
        let title = self.tableView(tableView, titleForHeaderInSection: section)
        if (title == "") {
            return 0.0
        }
        return 20.0
    }
}

