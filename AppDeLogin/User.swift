//
//  User.swift
//  AppDeLogin
//
//  Created by Erick Martins on 03/11/21.
//

import UIKit

class User{
    
    let name: String
    let email: String
    let password: String
    let passwordConf: String
    var image: UIImage?
    
    init(userName: String, userEmail: String, userPassword: String, userPasswordConf: String) {
        
        name = userName
        email = userEmail
        password = userPassword
        passwordConf = userPasswordConf
    }
}


