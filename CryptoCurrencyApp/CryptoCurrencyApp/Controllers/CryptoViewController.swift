//
//  CryptoViewController.swift
//  CryptoCurrencyApp
//
//  Created by Muhammad Qureshi on 9/17/21.
//

import UIKit

class CryptoViewController: UIViewController {
    let Api: String = "https://api.nomics.com/v1/currencies/ticker?key=3ccf169f8a57c4bcc6c5cf82951c0908450696f9&ids=BTC&interval=1d,30d&convert=EUR&per-page=100&page=1"
    @IBOutlet weak var btcImage: UIImageView!
    
    @IBOutlet weak var priceLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        _ = Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(refreshData), userInfo: nil, repeats: true)
        performMyRequest(urlString: Api)
    }
    @objc func refreshData() -> Void
    {
        performMyRequest(urlString: Api)
    }
    func performMyRequest(urlString: String){
        if let url = URL(string: urlString) {
        let browser = URLSession(configuration: .default)
        let search = browser.dataTask(with: url) { (data, response, error) in
            if (error != nil) {
                print("search error")
                print(error!)
            }
            if let safedata = data {
                let decoder = JSONDecoder()
                do {
                     let decoderData = try decoder.decode([DataModel].self, from: safedata)
                    //print(decoderData.self.price)
                    DispatchQueue.main.async {
                        self.priceLabel.text = decoderData[0].price
                    }
                }
                catch {
                  print("decode error")
                    print(error)
                }
            }
        }
        search.resume()
    }
    }
}

