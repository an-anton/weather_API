//
//  NetworkManager.swift
//  weather_API
//
//  Created by Anton Anan'eV on 26.11.2021.
//
import Foundation
import UIKit

class NetworkManager {
    
    func fetchData(for city: String, label: UILabel) {
        let urlString = "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=7c55737d96a6bb29c7232ab8df8d696a&units=metric"
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "no error description")
                return }
             
            do {
                let currentWeather = try JSONDecoder().decode(Weather.self, from: data)
                DispatchQueue.main.async {
                    label.text = """
\(currentWeather.name)
Температура: \(currentWeather.main.temp.rounded())
Ощущается как :\(currentWeather.main.feels_like.rounded())
Скорость ветра:\(currentWeather.wind.speed.rounded())
""" }
            } catch let error {
                print(error.localizedDescription)
            }
        }.resume()
    }
}
