//
//  SignUpViewController.swift
//  iOSLogIn
//
//  Created by Sukina Al-daboubi on 7/28/19.
//  Copyright © 2019 Sukina Al-daboubi. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    let signupViewModel = SignUpViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var username: UITextField!
    
    
    @IBAction func signupBT(_ sender: Any) {
        // Ensure that all fields are filled
        if ((email.text!.isEmpty) || (password.text!.isEmpty) || (username.text!.isEmpty)) {
            let title =  "One or more of the fields is not filled!"
            let message = "Please fill all the fields"
            
            showAlert(title: title, message: message, success: false)
            
        } else {
            // Register and add data to database
            signupViewModel.register(email: email.text!, username: username.text!, password: password.text!, success: { () in
                
                self.showAlert(title: "Successfully signed up", message:  nil, success: true)
                
                
                
                }) { () in
                    
                    // show alert that something wrong happened
                    let title = "Something went wrong, please try again"
                    
                    self.showAlert(title: title, message: nil, success: false)
            }
        }
    }
    
    
    
    func showAlert (title: String?, message: String?, success: Bool) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title:"Ok", style: .default) { (_) in
            if success {
            self.navigate(id: "login_stb")
            }
        }
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
    }
    
    
    
    func navigate (id: String){
        
        let stb = UIStoryboard(name: "Main", bundle: nil)
        let nextScreen = stb.instantiateViewController(withIdentifier: id)
        
        //self.dismiss(animated: true, completion: nil)
        self.present(nextScreen, animated: true, completion: nil)
        
    }
    
}
