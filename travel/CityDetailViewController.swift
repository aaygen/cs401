//
//  CityDetailViewController.swift
//  travel
//
//  Created by Duru Coskun on 25/04/2017.
//  Copyright © 2017 Ata Aygen. All rights reserved.
//

import UIKit
import FirebaseDatabase
import Kingfisher
import FirebaseStorage




class CityDetailViewController: UIViewController ,CityDataDelegate{
    
    
let storage = FIRStorage.storage().reference(forURL:"gs://travelapp-31a9e.appspot.com")
    @IBOutlet weak var cityImage: UIImageView!
    
    @IBOutlet weak var cityName: UILabel!
        @IBOutlet weak var countryName: UILabel!
    var currency : String = ""
    
    
    var selectedCity : NSDictionary = [:]
    let cityData = CityDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.title = "\(((selectedCity["DestinationCity"]) as AnyObject).uppercased!)"
        
        cityData.delegate = self
        
        self.cityName.text = " \(selectedCity["DestinationCity"]!) (\(selectedCity["Country"]!))"
        self.countryName.text = "\(((selectedCity["Country"]!)   as AnyObject).uppercased!)"
       
        let imagePath = "\(selectedCity["DestinationCity"]!).jpg"
        let url = storage.child(imagePath)
        print(url.name)
        self.cityImage.kf.setImage(with: URL(string:"gs://travelapp-31a9e.appspot.com/\(url.name)"))


        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        //   cityData.loadCityDetail(cityId: selectedCity!.cityId)
        
        
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
