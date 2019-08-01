//
//  LogInViewModel.swift
//  iOSLogIn
//
//  Created by Sukina Al-daboubi on 7/29/19.
//  Copyright © 2019 Sukina Al-daboubi. All rights reserved.
//

import UIKit
import FirebaseDatabase
import Firebase
import FirebaseAuth

class LogInViewModel {
    
    //var ref: DatabaseReference!
    var auth = Auth.auth()
    
    
    func forgetPassword (email: String, success: (() -> ())?, failed: (() -> ())?){
        
        auth.sendPasswordReset(withEmail: email) { error in
            if (error != nil){
                failed!()
            } else {
                success!()
            }
        }
        
    }
    
    
    
    func logIn (email: String, password: String, success: (() ->Void)?, failed: (( _ title: String) -> Void)?) {
        
        // Check if the user already have an account or not
        //ref = Database.database().reference()
        //ref.child("users")
        
        //guard let user = auth.currentUser else {return}
        
        auth.signIn(withEmail: email, password: password) { user, error in
            if error != nil {
                
                failed!( "Invalid email or password + \(error!)")
                
            } else {
                
                success!()
            }
        }
        
        /*ref.observeSingleEvent(of: .value) { snapshot in
            
            for uid in snapshot.children.allObjects as! [DataSnapshot]{
                
             
                // Does not have account
            
                if user.uid != uid.value as! String {
                    
                    failed!(nil, "Create an account first please")
                    
                } else if user.uid == uid.value as! String {
                    
                    // Log in
                    print ("In log in section")
                    self.auth.signIn(withEmail: email, password: password) { user, error in
                        
                        if let result = user {
                            
                            success!(result)
                            
                        } else {
                            
                            failed!(error!, "Wrong email or password")
                        }
                    }
                    
                } else {
                    failed!(nil, "Email or password are incorrect!")
                }
            }
        }*/
        
    }
}
