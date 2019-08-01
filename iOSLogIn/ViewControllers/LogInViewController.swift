//
//  LogInViewController.swift
//  iOSLogIn
//
//  Created by Sukina Al-daboubi on 7/28/19.
//  Copyright © 2019 Sukina Al-daboubi. All rights reserved.
//

import UIKit

class LogInViewController: UIViewController {

    let loginViewModel = LogInViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    
    @IBAction func forgetPassword(_ sender: Any) {
        if (email.text!.isEmpty){
            
            showAlert(title: "Please enter your email", message: "Email is required to recieve a Reset password link", success: false)
            
        } else {
            
            loginViewModel.forgetPassword(email: email.text!, success: {() in
                self.showAlert(title: "Please check your email", message: nil, success: false)
            }) {() in
                self.showAlert(title: "Something wrong happened, please try again.", message: nil, success: false)
            }
            
        }
        
    }
    
    
    
    @IBAction func loginBT(_ sender: Any) {

        if (email.text!.isEmpty || password.text!.isEmpty){
            
            let title = "One or more of the fields is not filled!"
            let message = "Please fill all the fields"
            
            showAlert(title: title, message: message, success: false)
        } else {
            // check if register or not
            loginViewModel.logIn(email: email.text!, password: password.text!, success: { () in
                self.showAlert(title: "Successfully logged in", message: nil, success: true)
                
                
            })
            { (title) in
                self.showAlert(title: title, message: nil, success: false)
            }
        }
    }
    
    @IBAction func signupBT(_ sender: Any) {
        
        navigate(id: "signup_stb")
    }
    

    
    
    func showAlert (title: String?, message: String?, success: Bool){
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title:"Ok", style: .default) { (_) in
            if success {
                self.navigate(id: "profile_stb")
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
