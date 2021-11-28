//
//  Weather.swift
//  weather_API
//
//  Created by Anton Anan'eV on 26.11.2021.
//
import Foundation

struct Weather: Decodable {
    let name: String
    let wind: Wind
    let main: Main
}
struct Wind: Decodable {
   let speed: Double
}
struct Main: Decodable {
    let temp: Double
    let feels_like: Double
}

//struct CurrentWeather {
//    let nameCity: String
//    let wind: Double
//    var windSpeed: String {
//        "\(wind.rounded())"
//    }
//
//    let temperature: Double
//    var tempString: String {
//        "\(temperature.rounded())"
//    }
//
//    let feelTemperature: Double
//}
