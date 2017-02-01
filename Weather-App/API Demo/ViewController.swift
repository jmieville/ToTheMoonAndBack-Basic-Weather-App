//
//  ViewController.swift
//  API Demo
//
//  Created by Jean-Marc Kampol Mieville on 10/16/2559 BE.
//  Copyright © 2559 Jean-Marc Kampol Mieville. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var cityInputName: String = ""
    var buttonPressed = false


    @IBOutlet weak var degreeCelsius: UILabel!
    @IBOutlet weak var city: UILabel!
    @IBOutlet weak var weatherCondition: UILabel!
    
    @IBOutlet weak var cityInputBox: UITextField!

    @IBAction func submitCityName(_ sender: AnyObject) {
                
        cityInputName = cityInputBox.text!.replacingOccurrences(of: " ", with: "")
        
        changeCityWeather()
        
        print(cityInputName)
        cityInputBox.endEditing(true)
        
    }
    
    
    func changeCityWeather() {
        
        
        let url = URL(string: "http://api.openweathermap.org/data/2.5/weather?q=\(cityInputName),uk&units=metric&appid=af01cc0475f79e722f443f915e1fe4bc")!
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if error != nil {
                print("error")
            } else {
                if let urlContent = data {
                    do {
                        //if let jsonResult = try JSONSerialization.jsonObject(with: urlContent, options: []) as? [String: AnyObject] {
                        let jsonResult = try JSONSerialization.jsonObject(with: urlContent, options: JSONSerialization.ReadingOptions.allowFragments)
                        let cityName = ((jsonResult) as AnyObject)["name"]
                        let weather = ((jsonResult as AnyObject)["weather"])
                        let weatherDescription = (((((jsonResult as AnyObject)["weather"]) as! NSArray)[0] as? NSDictionary)?["description"] as? String)
                        let mainDescription = ((jsonResult) as AnyObject)["main"]
                        let tempMainDescriptionTest = (((mainDescription) as AnyObject)["temp"] as? String)

                        
                        print(mainDescription)
                        //print(tempMainDescriptionTest + "this one")
                        print(tempMainDescriptionTest)
                        //let temperatureCelsius = (((((jsonResult as AnyObject)["temp"]) as! NSArray)[4] as? NSDictionary)?["main"] as? String)



                        
                        DispatchQueue.main.async {
                            
                            print(jsonResult)
                            
                            
                            
                            self.city.text = cityName as! String?
                            
                            print(((jsonResult) as AnyObject)["name"])
                            
                            
                            print(weather)
                            
                            
                            //print(((test as! NSArray)[0] as? NSDictionary)?["description"] as? String)
                            
                            
                            print(((((jsonResult as AnyObject)["weather"]) as! NSArray)[0] as? NSDictionary)?["description"] as? String)
                            
                            self.weatherCondition.text = weatherDescription as! String?
                            //self.degreeCelsius.text = temperatureCelsius as! String?
                            

                        }
                        
                                                //}
                    } catch {
                        print("Json processing failed")
                    }
                    
                }
            }
            
            
        }
        
        task.resume()
        print(task.currentRequest)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        /*
        
        let url = URL(string: "http://api.openweathermap.org/data/2.5/weather?q=\(cityInputName),uk&appid=af01cc0475f79e722f443f915e1fe4bc")!
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if error != nil {
                print("error")
            } else {
                if let urlContent = data {
                    do {
                        //if let jsonResult = try JSONSerialization.jsonObject(with: urlContent, options: []) as? [String: AnyObject] {

                        let jsonResult = try JSONSerialization.jsonObject(with: urlContent, options: JSONSerialization.ReadingOptions.allowFragments)
                        print(jsonResult)
                        
                        let cityName = ((jsonResult) as AnyObject)["name"]
                        
                        self.city.text = cityName as! String?
                        
                        print(((jsonResult) as AnyObject)["name"])
                        
                        let weather = ((jsonResult as AnyObject)["weather"])
                        
                        print(weather)
                        
                        
                        //print(((test as! NSArray)[0] as? NSDictionary)?["description"] as? String)
                        
                        let weatherDescription = (((((jsonResult as AnyObject)["weather"]) as! NSArray)[0] as? NSDictionary)?["description"] as? String)
                        
                        print(((((jsonResult as AnyObject)["weather"]) as! NSArray)[0] as? NSDictionary)?["description"] as? String)
                        
                        self.weatherCondition.text = weatherDescription as! String?

                        
                        //}
                    } catch {
                        print("Json processing failed")
                    }
                    
                }
            }
        
            
        }
        task.resume()
        
        */
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

