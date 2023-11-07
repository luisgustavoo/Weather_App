//
//  Service.swift
//  WeatherApp
//
//  Created by Luis Gustavo Vieira Santos on 06/11/23.
//

import Foundation

struct City{
    let lat: String
    let long: String
    let name: String
}

class Service {
    private let baseUrl: String = "https://api.openweathermap.org/data/3.0/onecall"
    private let apiKey: String = "fdf58a70845efcd91ea2a0c238b6b3ae"
    private let session = URLSession.shared
    
    func fetchData(city: City, completion: @escaping (String) -> Void) -> Void{
        let urlString = "\(baseUrl)?lat=\(city.lat)&lon=\(city.long)&appid=\(apiKey)"
        guard let url = URL(string: urlString) else {return}
        
        let task = session.dataTask(with: url) { Data, response, error in
            completion("Oi")
        }
        
        task.resume()
    }
    
}
