//
//  ViewController.swift
//  NetworkingApp
//
//  Created by Sergei Bakhmatov on 07.05.2023.
//

import UIKit

final class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        fatchFruits()
    }

}

extension ViewController {
    
    private func fatchFruits() {
        URLSession.shared.dataTask(with: URL(string: "https://www.fruityvice.com/api/fruit/all")!) { data, _, error in
            guard let data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let fruits = try decoder.decode([Fruit].self, from: data)
                print(fruits)
            } catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
    
}

