//
//  UserDefaults.swift
//  TharTrack
//
//  Created by Esoft on 15/10/19.
//  Copyright © 2019 Esoft. All rights reserved.
//

import Foundation


enum UserDefaultsKeys : String {
    case isLoggedIn
    case userID
    case userName
    case emailID
    case userToken
    case profileImage
    
}


extension UserDefaults {
    
    
    //MARK: Check Login
    func setLoggedIn(value: Bool) {
        set(value, forKey: UserDefaultsKeys.isLoggedIn.rawValue)
        //synchronize()
    }
    
    func isLoggedIn()-> Bool {
        return bool(forKey: UserDefaultsKeys.isLoggedIn.rawValue)
    }
    
    //MARK: Save User Data
    func setUserToken(value: String){
        set(value, forKey: UserDefaultsKeys.userToken.rawValue)
        //synchronize()
    }
    
    func setUserID(value: String){
        set(value, forKey: UserDefaultsKeys.userID.rawValue)
        //synchronize()
    }
    //MARK Save the profile image
    
    func setProfileImage(value: String) {
         set(value, forKey: UserDefaultsKeys.profileImage.rawValue)
    }
    
    //MARK: Retrieve User Data
    func getUserID() -> Int{
        return value(forKey: UserDefaultsKeys.userID.rawValue) as! Int
    }
    
    func setEmailID(value: String) {
        set(value, forKey: UserDefaultsKeys.emailID.rawValue)
    }
    
    func getEmail() -> String {
        return value(forKey: UserDefaultsKeys.emailID.rawValue) as! String
    }
    
    func setUserName(value: String) {
        set(value, forKey: UserDefaultsKeys.userName.rawValue)
    }
    
    func getUserName() -> String {
        return value(forKey: UserDefaultsKeys.userName.rawValue) as! String
    }
    func getUserToken() -> String {
        return value(forKey: UserDefaultsKeys.userToken.rawValue) as? String ?? ""
    }
    
    func getProfileImage() -> String {
        return value(forKey: UserDefaultsKeys.profileImage.rawValue) as! String
    }
    func reset() {
        removeObject(forKey: UserDefaultsKeys.userID.rawValue)
        removeObject(forKey: UserDefaultsKeys.userName.rawValue)
        removeObject(forKey: UserDefaultsKeys.emailID.rawValue)
       
        
        set(false, forKey: UserDefaultsKeys.isLoggedIn.rawValue)
    }
}
