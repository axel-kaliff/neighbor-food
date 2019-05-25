//
//  ViewController.swift
//  AlbumApp
//
//  Created by Pavel Bogart on 2/10/17.
//  Copyright © 2017 Pavel Bogart. All rights reserved.
//

import UIKit
import LBTAComponents

class copiedVC: UIViewController, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    let meals: [Meal] = {
        let axelUser = User(username: "Clankaliff", email: "axel.kaliff@gmail.com", bioText: "Just some sashimi rolls would be great, nothing too fancy. I'm allergic to peanuts so don't throw any Sickers™ in there you scum, rebel scum because im an imperial pilot and i want to shoot down the millenial falcon", profileImage: #imageLiteral(resourceName: "profilePic"))
        
        let sushi = Meal(user: axelUser, title: "Sushi", link: "sushi.com", description: "Just suhi dude and also gilbert godfried and also maybe ducks maybe? I dont know really what the purpose of all this is, maybe we're just an alien experiment i dont know. The universe is a dark forest and we should all just be as quiet as possible", price: 34, isVegan: true)
        
        let burgers = Meal(user: axelUser, title: "Burger", link: "sushi.com", description: "Just burgers dude and also gilbert godfried and also maybe ducks maybe? The universe is a dark forest and we should all just be as quiet as possible", price: 34, isVegan: true)
        
        return [sushi, burgers]
    }()

    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 16
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .clear
        return cv
    }()
    
    let mealsCellId = "mealsCellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.lightGray
        setupViews()
    }
    
    func setupViews() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = UIColor.lightGray
        collectionView.register(MealContainerCell.self, forCellWithReuseIdentifier: mealsCellId)
        print("setup")
        view.addSubview(collectionView)
        
        collectionView.anchor(view.topAnchor, left: view.leftAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: view.frame.width, heightConstant: view.frame.height)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: mealsCellId, for: indexPath) as! MealContainerCell
        cell.meals = meals
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height * 0.9)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
    }
}


