//
//  CityViewController.swift
//  travel
//
//  Created by Student on 23/04/2017.
//  Copyright © 2017 Ata Aygen. All rights reserved.
//

import UIKit

class CityViewController: UIViewController,UITableViewDataSource,UITableViewDelegate, CityDataDelegate{

    @IBOutlet weak var cityTableView: UITableView!
   
    
    var cityDataSource = CityDataSource()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "DESTINATIONS"
        cityTableView.dataSource = self
        //cityDataSource.delegate = self

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func numberOfSectionsInTableView(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        let cell = cityTableView.dequeueReusableCell(withIdentifier: "Identifier",for: indexPath as IndexPath) as! CityTableViewCell
        let city = (cityDataSource.destinations?[indexPath.row])!
        
        cell.destination.text = "DESTINATION : \(city["DestinationCity"]!)"
        cell.price.text = "MIN PRICE: \(city["MinPrice"]!)"
        
        
        return cell
    }
    
    override func viewDidAppear(_ animated: Bool) {
        cityTableView.delegate = self
        
       
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section : Int)-> Int {
        
        return (cityDataSource.destinations?.count)!
        
    }
    
    
    
    func cityListLoaded() {
        
        DispatchQueue.main.async {
            self.cityTableView.reloadData()
        }
        
    }
    
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        
        let selectedCell = sender as! CityTableViewCell
        
        let indexPath = self.cityTableView.indexPath(for : selectedCell)
        
        let controller = segue.destination as! CityDetailViewController
        
        controller.selectedCity = (cityDataSource.destinations?[indexPath!.row])!
    }
    

}
