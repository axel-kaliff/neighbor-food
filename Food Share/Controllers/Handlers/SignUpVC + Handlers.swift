//
//  SignUpVC + Handlers.swift
//  Food Share
//
//  Created by Axel Kaliff on 2018-08-25.
//  Copyright © 2018 Axel Kaliff. All rights reserved.
//

import Foundation
import UIKit


extension signUpVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    func handleSelectProfileImageView() {
        
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        
        present(picker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        
        var selectedImageFromPicker: UIImage?
        
        if let editedImage = info["UIImagePickerControllerEditedImage"] as? UIImage {
            selectedImageFromPicker = editedImage
        } else if let originalImage = info["UIImagePickerControllerOriginalImage"] as? UIImage {
            selectedImageFromPicker = originalImage
        }
        
        if let selectedImage = selectedImageFromPicker {
            
        }
        
        dismiss(animated: true, completion: nil)
    }
    
    
    //     action functions
    @objc func cancelButtonClicked() {
        handleSelectProfileImageView()
//        self.present(SignInVC.self(), animated: true, completion: nil)
//        usernameTextField.text = " "
//        passwordTextField.text = " "
//        emailTextField.text = " "
//        confirmPasswordTextField.text = " "
//        isChefSwitch.isOn = false
    }
    
    
    
    @objc func signUpButtonClicked() {
        if usernameTextField.text! != "" && self.passwordTextField.text! != "" && usernameTextField.text! != "" && passwordTextField.text! == confirmPasswordTextField.text! {
            AuthProvider.Instance.signUp(withUsername: usernameTextField.text!, withEmail: emailTextField.text!, password: passwordTextField.text!, isChef: false, loginHandler: { (message) in
                
                if message != nil {
                    AlertHandler.Instance.alertUser(on: self,title: "Problem With Creating A New User", message: message!)
                    
                } else {
                    self.usernameTextField.text = ""
                    self.passwordTextField.text = ""
                    self.confirmPasswordTextField.text = ""
                    self.emailTextField.text = ""
                    
                    UserHandler.Instance.updateUserData(completionHandler: { (sucess) -> Void in
                        if sucess {
                            self.present(MapVC.self(), animated: true, completion: nil)
                        }
                    })
                    
                }
                
            })
        } else if passwordTextField.text! != confirmPasswordTextField.text! {
            AlertHandler.Instance.alertUser(on: self, title: "Passwords Doesn't Match", message: "Please make sure you write the same passwords in both fields")
        } else {
            AlertHandler.Instance.alertUser(on: self,title: "Email And Password Are Required", message: "Please Enter Email And Password")
        }
    }
}
