//
//  ViewController.swift
//  13.Network
//
//  Created by student on 2018/12/18.
//  Copyright © 2018年 xtx. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    let url = URL(string: "http://t.weather.sojson.com/api/weather/city/101270101")!
    var weather:AnyObject!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func loadCity(_ sender: Any) {
        AF.request(url).responseJSON { (response) in
            self.weather = response.value as AnyObject
            print(self.weather)
            self.performSegue(withIdentifier: "ShowCity", sender: self)
        }
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowCity"{
            if let secVC = segue.destination as? CityTableViewController{
                secVC.weather = self.weather
            }
        }
    }

}

