//
//  ViewController.swift
//  CryptoCurrencyApp
//
//  Created by Muhammad Qureshi on 9/17/21.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var usernameTxtfld: UITextField!
    @IBOutlet weak var pswrdtxtfld: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.pswrdtxtfld.delegate = self
        self.usernameTxtfld.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {

        if usernameTxtfld.text == "M" && pswrdtxtfld.text == "786"{
            performSegue(withIdentifier: "showDetail", sender: Any?.self)
        }
        return true
    }

//    func performAction() {
//
//    }
}
