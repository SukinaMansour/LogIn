//
//  ProfileViewController.swift
//  iOSLogIn
//
//  Created by Sukina Al-daboubi on 7/30/19.
//  Copyright © 2019 Sukina Al-daboubi. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    
    @IBOutlet weak var emailProfile: UILabel!
    @IBOutlet weak var usernameProfile: UILabel!
    
    var profileViewModel = ProfileViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        profileViewModel.viewData(success: { (email, username) in
            self.emailProfile.text = email
            self.usernameProfile.text = username
            
        })
        
    }
    

    @IBAction func logOut(_ sender: Any) {
        profileViewModel.logOut()
        
        let stb = UIStoryboard(name: "Main", bundle: nil)
        let nextScreen = stb.instantiateViewController(withIdentifier: "Main_stb")
        
        self.present(nextScreen, animated: true, completion: nil)
        
    }
    

}
