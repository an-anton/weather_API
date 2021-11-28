//
//  WeatherCollectionViewController.swift
//  weather_API
//
//  Created by Anton Anan'eV on 28.11.2021.
//

import UIKit



class WeatherCollectionViewController: UICollectionViewController {

    // MARK: - PRIVATE PROPERTIES
    private var citys: [Weather] = []
    private let netManager = NetworkManager()
    

    // MARK: - UICollectionViewDataSource
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CustomCollectionViewCell
        cell.layer.cornerRadius = calculateSizeItem() / 8
        netManager.fetchData(for: "Moscow", label: cell.itemLabel)
        return cell
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
