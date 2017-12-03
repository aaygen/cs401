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
    
    
    
<<<<<<< HEAD
    var userUid : String?
    var cityname : String?
    var countryname : String?
    
    var pop: String = ""
    @IBOutlet weak var cityInfo: UILabel!
    
    @IBOutlet weak var population: UILabel!
    @IBOutlet weak var cityImage: UIImageView!
    
    @IBOutlet weak var cityName: UILabel?
    @IBOutlet weak var countryName: UILabel?
    var currency : String = ""
    
    var ref :FIRDatabaseReference!
    
=======
    
    var pop: String = ""
    @IBOutlet weak var cityInfo: UILabel!


    @IBOutlet weak var population: UILabel!
    @IBOutlet weak var cityImage: UIImageView!
    
    //@IBOutlet weak var cityName: UILabel!
        @IBOutlet weak var countryName: UILabel!
    var currency : String = ""
    
>>>>>>> origin/master
    let storage = FIRStorage.storage()
    var selectedCity : NSDictionary = [:]
    let cityData = CityDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = FIRDatabase.database().reference()
        let storageRef = storage.reference().child("\(selectedCity["DestinationCity"]!).jpg")
        storageRef.downloadURL { (url, error)-> Void in
            if (url != nil){
                let newUrl = (url?.absoluteString)
                self.cityImage.kf.setImage(with: URL(string : newUrl!))
            }else {
                self.cityImage.kf.setImage(with: URL (string : "https://firebasestorage.googleapis.com/v0/b/travelapp-31a9e.appspot.com/o/Prag.jpg?alt=media&token=c5f0100b-4f5d-4ec6-a1b0-61a197598ecf"))
            }
        }
        
<<<<<<< HEAD
        let networkSession = URLSession.shared
        let dataUrl = "https://www.triposo.com/api/v2/location.json?id=\(selectedCity["DestinationCity"]!)&fields=intro,properties&account=RJ1V77PU&token=dvz1fidxe66twck6qynircn6ii3o2ydg"
        var req = URLRequest(url: URL(string: dataUrl)!)
=======
        let storageRef = storage.reference().child("\(selectedCity["DestinationCity"]!).jpg")
        storageRef.downloadURL { (url, error)-> Void in
            if (url != nil){
             let newUrl = (url?.absoluteString)
            self.cityImage.kf.setImage(with: URL(string : newUrl!))
            }else {
                self.cityImage.kf.setImage(with: URL (string : "https://firebasestorage.googleapis.com/v0/b/travelapp-31a9e.appspot.com/o/Prag.jpg?alt=media&token=c5f0100b-4f5d-4ec6-a1b0-61a197598ecf"))
            }
        }
        let cityname: String = selectedCity["DestinationCity"]! as! String
        let trimmedName = cityname.replacingOccurrences(of: " ", with: "")      //.stringByReplacingOccurrencesOfString(" ", withString: "")
        print(trimmedName)
        let networkSession = URLSession.shared
        let dataUrl = "https://www.triposo.com/api/v2/location.json?id=\(trimmedName)&fields=intro,properties&account=RJ1V77PU&token=dvz1fidxe66twck6qynircn6ii3o2ydg"
      var req = URLRequest(url: URL(string: dataUrl)!)
>>>>>>> origin/master
        
        req.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let dataTask = networkSession.dataTask(with: req) {(data,response,error) in print("Data")
            
            let jsonReadable = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
            print(jsonReadable!)
            do
            {
<<<<<<< HEAD
                let jsonDictionary = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as! [String: Any]
=======
                 let jsonDictionary = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as! [String: Any]
>>>>>>> origin/master
                
                let resultArray = jsonDictionary["results"]! as! NSArray
                for result in resultArray{
                    let resultDictionary = result as! NSDictionary
                    let intro = resultDictionary["intro"]! as! String
                    DispatchQueue.main.async() {
<<<<<<< HEAD
                        self.cityInfo.text = intro
=======
                    self.cityInfo.text = intro
>>>>>>> origin/master
                    }
                    let propertiesArray = resultDictionary["properties"] as! NSArray
                    
                    for item in propertiesArray{
                        let dict = item as! NSDictionary
<<<<<<< HEAD
                        self.pop = dict["value"]! as! String
                        DispatchQueue.main.async() {
                            self.population.text = "Population : \(self.pop)"
                        }
                        // self.population.text = "Population :\(self.pop)"
                    }
                    
                    
                    // let info = intro["intro"] as! String
                    print(intro)
                    print("INTROOOO")
                    
                    // print (result)
=======
                    self.pop = dict["value"]! as! String
                           DispatchQueue.main.async() {
                        self.population.text = "Population : \(self.pop)"
                        }
                     // self.population.text = "Population :\(self.pop)"
                    }
                    
                
                   // let info = intro["intro"] as! String
                    print(intro)
                    
                    
                   // print (result)
>>>>>>> origin/master
                }
            }
            catch
            {
                print("We have a JSON exception")
            }
<<<<<<< HEAD
            
            
            
        }
        dataTask.resume()
        self.title = "\(((selectedCity["DestinationCity"]) as AnyObject).uppercased!)"
        
        cityData.delegate = self
        // "DESTINATION : \(city["DestinationCity"]!
        
        cityname = (("\(selectedCity["DestinationCity"]!)" ) as String)
        countryname = (("\(selectedCity["Country"]!) ") as String)
        self.cityName?.text = cityname
        self.countryName?.text = countryname
        
=======
         
           
       
        }
  dataTask.resume()
        self.title = "\(((selectedCity["DestinationCity"]) as AnyObject).uppercased!)"
        
        cityData.delegate = self
        print(selectedCity["DestinationCity"])
        //self.cityName.text = " \(selectedCity["DestinationCity"]!) (\(selectedCity["Country"]!))"
        self.countryName.text = "\(((selectedCity["Country"]!)   as AnyObject).uppercased!)"
       
                

>>>>>>> origin/master
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
    @IBAction func addCities(_ sender: Any) {
        var name = cityname as String!
        var country = countryname as String!
        
        ref.child("SavedCities").child("\(self.userUid!)").observeSingleEvent(
            of: FIRDataEventType.value, with: { (snapshot) in
                
                if snapshot.hasChild("\(name!)"){
                    
                    let alert = UIAlertController(title: "", message: "You already have the city in your list!", preferredStyle: UIAlertControllerStyle.alert)
                    alert.addAction(UIAlertAction(title: "Close", style: UIAlertActionStyle.default, handler:nil))
                    self.present(alert, animated:true,completion:nil)
                    
                    
                    //ALERT you already added this city
                }else{
                    
                    self.ref.child("SavedCities").child("\(self.userUid!)").child("\(name!)").setValue(["City Name":"\(name!)","Country":"\(country!)"])
                    
                    let alert = UIAlertController(title: "Oops!", message: "The city has been added to your list!", preferredStyle: UIAlertControllerStyle.alert)
                    alert.addAction(UIAlertAction(title: "Close", style: UIAlertActionStyle.default, handler:nil))
                    self.present(alert, animated:true,completion:nil)
                    
                    // ALERT the city has been added to your list!
                    
                    
                }
                
        } )
    }
}
