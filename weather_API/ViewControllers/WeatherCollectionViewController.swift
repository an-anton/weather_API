//
//  WeatherCollectionViewController.swift
//  weather_API
//
//  Created by Anton Anan'eV on 28.11.2021.
//

import UIKit

class WeatherCollectionViewController: UICollectionViewController {

    // MARK: - PRIVATE PROPERTIES
    private var citys: [String] = ["Moscow", "Samara", "Ufa"]
    private let netManager = NetworkManager()
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
    }
    

    // MARK: - UICollectionViewDataSource
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return citys.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CustomCollectionViewCell
        cell.layer.cornerRadius = calculateSizeItem() / 8
        let city = citys[indexPath.item]
        netManager.fetchData(for: city, label: cell.itemLabel)
        return cell
    }
     // MARK: - NAVIGATION
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        guard let addCityVC = segue.source as? AddCityViewController else { return }
        guard let newCity = addCityVC.addCityTextField.text else { return }
        citys.append(newCity)
        print(citys)
        collectionView.reloadData()
    }
}
 // MARK: - EXTENSION
extension WeatherCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: calculateSizeItem(), height: calculateSizeItem() / 1.5)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        20
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        20
    }
    
    func calculateSizeItem() -> CGFloat {
        let countItem: CGFloat = 2
        let margin = CGFloat(20 * (countItem + 1))
        let widthItem = (view.bounds.width - margin) / countItem
        return widthItem
    }
}

