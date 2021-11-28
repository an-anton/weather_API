//
//  ViewController.swift
//  weather_API
//
//  Created by Anton Anan'eV on 26.11.2021.
//

import UIKit

class ViewController: UIViewController {
     // MARK: - @IBOutlets
//    @IBOutlet var labelOutlet: UILabel!
    
     // MARK: -  private property
    private let city = "Moscow"
    private let networkManager = NetworkManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        networkManager.fetchData(for: city, label: labelOutlet)
    }
    
    
}


