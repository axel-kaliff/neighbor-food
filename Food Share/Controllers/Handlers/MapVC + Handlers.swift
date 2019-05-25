//
//  MapVC + Handlers.swift
//  Food Share
//
//  Created by Axel Kaliff on 2018-08-25.
//  Copyright © 2018 Axel Kaliff. All rights reserved.
//

import Foundation

extension MapVC {
    @objc func settingsButtonClicked() {
        self.present(SettingsVC.self(), animated: true, completion: nil)
    }
    
    @objc func makeRequestButtonClicked() {
        print("make request")
        handleGestureBegan()
    }
    
    @objc func cancelClicked() {
        cancelAnimation()
    }
    
    @objc func doneButtonClicked() {
        print("done button")
        
        lookUpCurrentLocation { (city) in
            //            if let currentCity = city {self.userCity = currentCity.locality! as String}
            
            let newUser = User(username: "Clankaliff", email: "axel.kaliff@gmail.com", bioText: "My name is Hari Seldon and I know the future", profileImage: #imageLiteral(resourceName: "profilePic"), password: "Hello")
            
            let meal = Meal(user: newUser, title: self.nameField.text!, link: self.linkField.text!, description: self.descField.text!, image: #imageLiteral(resourceName: "sushi"), price: 12, isVegan: self.isVegan.isOn, city: self.userCity)
            
            MealRequestHandler.Instance.requestMeal(meal: meal)
            self.cancelAnimation()
            
            //            MealRequestHandler.Instance.requestMeal(meal: meal, latitude: (self.userLocation?.latitude)!, longitude: (self.userLocation?.longitude)!, mealName: self.nameField.text!, mealDesc: self.descField.text!, wantDelivery: self.wantDeliveredSwitch.isOn, link: self.linkField.text!, isVegan: self.isVegan.isOn, city: self.userCity)
            
            //            if self.nameField.text != "" && self.descField.text != "" {
            //                MealRequestHandler.Instance.requestMeal(latitude: (self.userLocation?.latitude)!, longitude: (self.userLocation?.longitude)!, mealName: self.nameField.text!, mealDesc: self.descField.text!, wantDelivery: self.wantDeliveredSwitch.isOn, link: self.linkField.text!, isVegan: self.isVegan.isOn, city: self.userCity)
            //                print(self.userCity)
            //                self.cancelAnimation()
            //            } else {
            //                AlertHandler.Instance.alertUser(on: self, title: "Please Fill Form", message: "Sure You Didn't Leave Some Fields Empty?")
            //            }
        }
    }

}
