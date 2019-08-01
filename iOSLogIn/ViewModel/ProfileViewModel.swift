//
//  ProfileViewModel.swift
//  iOSLogIn
//
//  Created by Sukina Al-daboubi on 7/31/19.
//  Copyright © 2019 Sukina Al-daboubi. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import FirebaseAuth

class ProfileViewModel {
    
    var ref: DatabaseReference!
    var auth = Auth.auth()
    
    var username = ""
    var email = ""
    
    func viewData (success: @escaping (_ username: String, _ email: String) -> ()) {
        
        
        let user = auth.currentUser
        
        ref = Database.database().reference().child("users").child(user!.uid).child("username")
        
        ref.observeSingleEvent(of: .value, with: { snapshot in
            
            self.username = (snapshot.value as? String)!
         
            self.email = (user?.email)!
            
            //print("username : \(self.username)    email: \(self.email))")
        
            success(self.username, self.email)
    } )
        
        
}
    
    
    func logOut() {
        
        try! _ = auth.signOut()
        
    }
    
}
