//
//  SignUpViewModel.swift
//  iOSLogIn
//
//  Created by Sukina Al-daboubi on 7/29/19.
//  Copyright © 2019 Sukina Al-daboubi. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase
import FirebaseDatabase


class SignUpViewModel {
    
    var auth = Auth.auth()
    var ref: DatabaseReference!
    
    
    func register (email: String,username: String, password: String, success:( () -> Void)?, failed: (() -> Void)?) {
        
        auth.createUser(withEmail: email, password: password) { authResult, error in
            
            guard let user = self.auth.currentUser else {return}
            
            if error != nil {
                
                failed!()

            } else {
                
                // add user data to database using UID
                self.ref = Database.database().reference()
                self.ref.child("users").child(user.uid).child("username").setValue(username)
                self.ref.child("users").child(user.uid).child("password").setValue(password)
                
                success!()
                
            }
        }
    }
}
