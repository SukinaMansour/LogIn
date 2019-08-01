//
//  ViewController.swift
//  iOSLogIn
//
//  Created by Sukina Al-daboubi on 7/28/19.
//  Copyright © 2019 Sukina Al-daboubi. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5, execute: {
            let stb = UIStoryboard(name: "Main", bundle: nil)
            let logInScreen = stb.instantiateViewController(withIdentifier: "login_stb")
            
            //self.dismiss(animated: true, completion: nil)
            self.present(logInScreen, animated: true, completion: nil)
        })
    }


}

