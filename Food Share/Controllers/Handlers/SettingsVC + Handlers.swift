//
//  SettingsVC + Handlers.swift
//  Food Share
//
//  Created by Axel Kaliff on 2018-08-25.
//  Copyright © 2018 Axel Kaliff. All rights reserved.
//

import Foundation
import UIKit

extension SettingsVC {
    //action functions
    @objc func saveButtonClicked() {
        if passwordTextField.text == UserHandler.Instance.getPassword() {
            if usernameTextField.text?.isEmpty == false {
                //                DBProvider.Instance.saveUser(withId: (AuthProvider.currentUser?.uid)!, withUsername: usernameTextField.text!, withEmail: UserHandler.Instance.email, password: passwordTextField.text!, isChef: isChefSwitch.isOn)
                DBProvider.Instance.saveUser(withId: (AuthProvider.currentUser?.uid)!, user: UserHandler.Instance.currentUser!)
                
                UserHandler.Instance.updateUserData(completionHandler: { (sucess) -> Void in
                    if sucess {
                        self.present(MapVC.self(), animated: true, completion: nil)
                    }
                })
            }
        } else {
            AlertHandler.Instance.alertUser(on: self,title: "Wrong Password", message: "To make changes to your profile, please input the correct password")
        }
    }
    
    @objc func logOutButtonClicked() {
        if AuthProvider.Instance.logOut() {
            self.present(SignInVC.self(), animated: true, completion: nil)
        } else {
            AlertHandler.Instance.alertUser(on: self,title: "Problem Logging Out", message: "Could not log out at the moment, please try again later")
        }
    }
    
    @objc func cancelButtonClicked() {
        //        self.present(MapVC.self(), animated: true, completion: nil)
        dismiss(animated: true) {
            self.usernameTextField.text = UserHandler.Instance.username
            self.passwordTextField.text = " "
        }
    }
}
