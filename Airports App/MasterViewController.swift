//

//  MasterViewController.swift

//  Airports App

//

//  Created by kumaran V on 02/03/17.

//  Copyright © 2017 Kumaran. All rights reserved.

//



import UIKit
class MasterViewController: UITableViewController {
    
    var detailViewController: DetailViewController? = nil
    var airportsList = [Any]()
    var spinner = UIActivityIndicatorView()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        tableView.tableFooterView = UIView(frame: .zero)
        self.setupSpinner()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Refresh", style: .plain, target: self, action: #selector(refreshButtonAction))
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.updateAirportLists(notification:)), name: Notification.Name("AirportsListReceivedNotification"), object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.showFailureMessage(notification:)), name: Notification.Name("AirportsListFetchFailed"), object: nil)
        self.startFetchingAirportsList()
        
        
        if let split = self.splitViewController {
            
            let controllers = split.viewControllers
            
            self.detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController
        }
        
    }
    
    func startFetchingAirportsList()
    {
        
        let api = ApiClient()
        api.getAllAirports()
        spinner.startAnimating()
        self.navigationItem.title = "Loading Airports List..."
        
    }
    override func viewWillAppear(_ animated: Bool) {
        
        self.clearsSelectionOnViewWillAppear = self.splitViewController!.isCollapsed
        
        super.viewWillAppear(animated)
        
    }
    
    func refreshButtonAction()
    {
        self.startFetchingAirportsList()
    }
    
    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
        
    }
    
    func setupSpinner(){
        
        spinner = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 60, height:60))
        
        self.spinner.center = self.view.center
        self.spinner.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.gray
        let transform: CGAffineTransform = CGAffineTransform(scaleX: 1.5, y: 1.5)
        self.spinner.transform = transform
        self.view.addSubview(spinner)
        spinner.hidesWhenStopped = true
        
    }
    
    // MARK: - Segues
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "showDetail" {
            
            if let indexPath = self.tableView.indexPathForSelectedRow {
                
                let airport = airportsList[indexPath.row] as! Airport
                let controller = (segue.destination as! UINavigationController).topViewController as! DetailViewController
                controller.airport = airport
                controller.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem
                controller.navigationItem.leftItemsSupplementBackButton = true
                
            }
            
        }
        
    }
    
    func showFailureMessage(notification: Notification){
        
        let alert = UIAlertController(title: "Error", message: "There seems to be an error connecting to the server. Please try again later.", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        self.spinner.stopAnimating()
        self.navigationItem.title = "Quantas Airports"
        
        
    }
    
    func updateAirportLists(notification: Notification){
        
        self.navigationItem.title = "Quantas Airports"
        self.spinner.stopAnimating()
        airportsList =  notification.object as! [AnyObject]
        self.tableView.reloadData()
        
    }
    
    // MARK: - Table View

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
        
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return airportsList.count
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let airport = airportsList[indexPath.row] as! Airport
        cell.textLabel!.text = airport.display_name
        cell.detailTextLabel?.text = airport.country
        cell.accessoryType = UITableViewCellAccessoryType.disclosureIndicator
        
        return cell
        
    }
    
}

