//
//  CitiesViewController.swift
//  WeatherApp
//
//  Created by Pick Jobs on 8/29/20.
//  Copyright © 2020 Pick Jobs. All rights reserved.
//

import UIKit

protocol CitiesViewControllerDelegate: class {
    func didSelectCity(city: City)
}



class CitiesViewController: UIViewController {
    
    //MARK: - Outlet Connections -
    
    @IBOutlet var mainTableView: UITableView! {
        didSet { self.registerCell() }
    }
    
    weak var delegate: CitiesViewControllerDelegate?
    
    //MARK: - Lifecycle Methods -
    
    
    var cities = [City]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadData()
    }
    
    func registerCell () {
        let citiesCell = UINib(nibName: "CitiesTableViewCell", bundle: nil)
        self.mainTableView.register(citiesCell, forCellReuseIdentifier: "CitiesTableViewCell")
    }
    
    func loadData(){
        self.cities.append(City(latitude: 43.856, longitude: 18.413, name: "Sarajevo", country: "Bosnia and Herzegovina", image: UIImage(named: "Sarajevo")!))
        self.cities.append(City(latitude: 44.22637, longitude: 17.66583, name: "Travnik", country: "Bosnia and Herzegovina", image: UIImage(named: "Travnik")!))
        self.cities.append(City(latitude: 43.34333, longitude: 17.80806, name: "Mostar", country: "Bosnia and Herzegovina", image: UIImage(named: "Mostar")!))
        self.cities.append(City(latitude: 44.53842, longitude: 18.66709, name: "Tuzla", country: "Bosnia and Herzegovina", image: UIImage(named: "Tuzla")!))
        self.cities.append(City(latitude: 44.77583, longitude: 17.18556, name: "Banja Luka", country: "Bosnia and Herzegovina", image: UIImage(named: "Banja Luka")!))
        self.cities.append(City(latitude: 44.20169, longitude: 17.90397, name: "Zenica", country: "Bosnia and Herzegovina", image: UIImage(named: "Zenica")!))
        self.cities.append(City(latitude: 44.34203, longitude: 17.27059, name: "Jajce", country: "Bosnia and Herzegovina", image: UIImage(named: "Jajce")!))
        self.cities.append(City(latitude: 44.61191, longitude: 17.98552, name: "Tesanj", country: "Bosnia and Herzegovina", image: UIImage(named: "Tesanj")!))
        self.cities.append(City(latitude: 42.71197, longitude: 18.34362, name: "Trebinje", country: "Bosnia and Herzegovina", image: UIImage(named: "Trebinje")!))
        self.cities.append(City(latitude: 44.81694, longitude: 15.87083, name: "Bihac", country: "Bosnia and Herzegovina", image: UIImage(named: "Bihac")!))
    }
 
}

    //MARK: - Extension for Delegate and DataSource Methods -

extension CitiesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row: Int = indexPath.row
        let city: City = self.cities[indexPath.row]
        let cell = self.mainTableView.dequeueReusableCell(withIdentifier: "CitiesTableViewCell", for: indexPath) as? CitiesTableViewCell
        
        cell?.cityLabel.text = city.name
        cell?.countryLabel.text = city.country
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row:Int = indexPath.row
        let city:City = self.cities[indexPath.row]
        
        self.delegate?.didSelectCity(city: city)
        DispatchQueue.main.async {
            self.dismiss(animated: true, completion: nil)
        }
    }
    
}
 
