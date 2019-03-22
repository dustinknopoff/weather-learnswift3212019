//
//  ViewController.swift
//  weather
//
//  Created by Dustin Knopoff on 3/21/19.
//  Copyright © 2019 Dustin Knopoff. All rights reserved.
//

import UIKit

struct Currently : Codable {
    let temperature: Float
    let precipProbability: Float
}

struct RootWeather : Codable {
    let currently: Currently
}

class ViewController: UIViewController {

    @IBOutlet weak var currentTempLabel: UILabel!
    @IBOutlet weak var umbrellaLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Make your own free API key with Dark sky at darksky.net
        let weatherUrl = URL(string: "https://api.darksky.net/forecast/76b2f04f15f3d423a1f4a097079e9b19/42.3140089,71.2504676")!
        let urlSession = URLSession(configuration: .default)
        urlSession.dataTask(with: weatherUrl) { (data, response, error) in
            let rootWeather = try! JSONDecoder().decode(RootWeather.self, from: data!)
            let currentWeather = rootWeather.currently
            self.currentTempLabel.text = " \(currentWeather.temperature)℉"
//            if currentWeather.precipProbability > 0.5 {
//                self.umbrellaLabel.text = "☔️"
//            } else {
//                self.umbrellaLabel.text = "🌂"
//            }
            self.currentTempLabel.text = currentWeather.precipProbability > 0.5 ?  "☔️" : "🌂"
        }.resume()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

