//
//  ViewController.swift
//  WeatherApp
//
//  Created by Pick Jobs on 8/9/20.
//  Copyright © 2020 Pick Jobs. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {

    //MARK: - Outlets -
    
    @IBOutlet var gradientOutlet: Gradient!
    @IBOutlet var temperatureLabel: UILabel!
    @IBOutlet var weatherIconImageView: UIImageView!
    @IBOutlet var summaryLabel: UILabel!
    @IBOutlet var cityLabel: UILabel! {
        didSet { self.addTapGesture()}
    }
    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var mainBackgroundImage: UIImageView!
    
    
    
    var latitude: Double = 43.856 {
        didSet { self.fetchData()}
    }
    var longitude: Double = 18.413 {
        didSet { self.fetchData()}
    }
    
    //MARK: - Lifecyle -
    
    var weather: Weather? {
        didSet{
            
            //self.weatherIconImageView.image = self.weather?.forecast.image
            //self.cityLabel.text = self.weather?.city.rawValue
        }
    }
    
    
    var apiFetching: ApiFetch = ApiFetch(){
        didSet{
            DispatchQueue.main.async {
                self.temperatureLabel.text = "\(self.apiFetching.temperature.toCelsius) °C"
                self.timeLabel.text = "\(self.apiFetching.time.getDateStringFromUTC())"
                self.summaryLabel.text = self.apiFetching.summary
                self.weatherIconImageView.image = self.apiFetching.weatherImage
                //self.cityLabel.text = self.apiFetching.timezone

        }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        //weatherIconImageView.image = self.apiFetching.weatherImage
        //self.cityLabel.text = self.weather?.city.rawValue

    }
    func fetchData(){
        let baseURL: String = "https://api.darksky.net/forecast"
                let key: String = "ddcc4ebb2a7c9930b90d9e59bda0ba7a"
        let url: URL = URL (string: "\(baseURL)/\(key)/\(self.latitude),\(self.longitude)?exclude=[flags,minutely,hourly]")!
                
                    let session = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
                        do {
                            if let jsonResponse = try JSONSerialization.jsonObject(with: data!, options: []) as? [String : Any], let results = jsonResponse["currently"] as? [String : Any]  {
                                self.apiFetching = ApiFetch(results)
                            }else {
                                    print("Parsiranje nije uspjelo")
                            }
                        } catch let parsingError {
                            print ("Error", parsingError)
                        }
                    })
                    session.resume()
        
                }
     
}

fileprivate extension WeatherViewController {
    
    func addTapGesture(){
        
        let tapAction = UITapGestureRecognizer(target: self, action: #selector(actionTapped(_:)))
        self.cityLabel?.isUserInteractionEnabled = true
        self.cityLabel?.addGestureRecognizer(tapAction)
        
    }
    
    @objc func actionTapped(_ sender: UITapGestureRecognizer){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc: CitiesViewController = storyboard.instantiateViewController(identifier: "CitiesViewController")
        
        vc.delegate = self
        self.present(vc, animated: true, completion: nil)
    
}
}

//MARK: - Cities View Controller Delegate -


extension WeatherViewController: CitiesViewControllerDelegate {
    
    func didSelectCity(city: City) {
        self.cityLabel.text = city.name
        self.latitude = city.latitude
        self.longitude = city.longitude
        self.mainBackgroundImage.image = city.image
        
    }
    
    
    
}
