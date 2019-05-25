//
//  Cells.swift
//  Food Share
//
//  Created by Axel Kaliff on 2018-08-17.
//  Copyright © 2018 Axel Kaliff. All rights reserved.
//

import LBTAComponents

class UserHeader: DatasourceCell {
    
    let textLabel: UILabel = {
       let label = UILabel()
        label.textColor = UIHandler.UIConstants.accentColor
        label.text = "Local Meal Requests"
        label.font = UIFont(name: UIHandler.UIConstants.standardFontName, size: 24)
        return label
    }()
    
    override func setupViews() {
        super.setupViews()
        
        backgroundColor = .white
        
        separatorLineView.isHidden = false
        separatorLineView.backgroundColor = .gray
        
        addSubview(textLabel)
        textLabel.anchor(topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 12, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
    }
}

class UserCell: DatasourceCell {
    
    override var datasourceItem: Any? {
        didSet {
            guard let user = datasourceItem as? User else {return}
            nameLabel.text = user.username
            usernameLabel.text = "usernmae"
            bioTextView.text = user.bioText
        }
    }
    
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "dishImage")
        
        imageView.layer.cornerRadius = 5
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Clankaliff"
        label.font = UIFont(name: UIHandler.UIConstants.standardFontNameBold, size: 16)
        return label
    }()
    
    let usernameLabel: UILabel = {
        let label = UILabel()
//        label.text = UserHandler.Instance.username

        label.text = "@axelkaliff"
        label.font = UIFont(name: UIHandler.UIConstants.standardFontName, size: 14)
        label.textColor = UIColor.gray
        return label
    }()
    
    let bioTextView: UITextView = {
       let textView = UITextView()
        textView.text = "Airbnb for food. The disruptive food app for the sharing economy"
        textView.font = UIFont(name: UIHandler.UIConstants.standardFontName, size: 15)
        return textView
    }()
    
    override func setupViews() {
        super.setupViews()
        backgroundColor = .white
        
        
        separatorLineView.isHidden = false
        separatorLineView.backgroundColor = .gray
        
        addSubview(profileImageView)
        addSubview(nameLabel)
        addSubview(usernameLabel)
        addSubview(bioTextView)
        
        profileImageView.anchor(self.topAnchor, left: self.leftAnchor, bottom: nil, right: nil, topConstant: 12, leftConstant: 12, bottomConstant: 0, rightConstant: 0, widthConstant: 50, heightConstant: 50)
        
        nameLabel.anchor(profileImageView.topAnchor, left: profileImageView.rightAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 8, bottomConstant: 0, rightConstant: 12, widthConstant: 0, heightConstant: 20)
        
        usernameLabel.anchor(nameLabel.bottomAnchor, left: nameLabel.leftAnchor, bottom: nil, right: nameLabel.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 20)
        
        bioTextView.anchor(usernameLabel.bottomAnchor, left: usernameLabel.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, topConstant: -4, leftConstant: -4, bottomConstant: 1, rightConstant: 12, widthConstant: 0, heightConstant: 0)
    }
}



class MealRequestCell: DatasourceCell {
    
    override var datasourceItem: Any? {
        didSet {
            // nameLabel.text = datasourceItem as? String
            guard let meal = datasourceItem as? Meal else {return}
            //            nameLabel.text = user.requestedMealName
            nameLabel.text = meal.title
//            usernameLabel.text = "usernmae"
            bioTextView.text = meal.description
            //            priceLabel.text = "$\(user.requestedMealPrice)"
            //            priceLabel.text = "2"
        }
    }
    
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "dishImage")
        
        imageView.layer.cornerRadius = 5
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Clankaliff"
        label.font = UIFont(name: UIHandler.UIConstants.standardFontNameBold, size: 16)
        return label
    }()
    
    let usernameLabel: UILabel = {
        let label = UILabel()
        //        label.text = UserHandler.Instance.username
        
        label.text = "@axelkaliff"
        label.font = UIFont(name: UIHandler.UIConstants.standardFontName, size: 14)
        label.textColor = UIColor.gray
        return label
    }()
    
    let bioTextView: UITextView = {
        let textView = UITextView()
        textView.text = "Airbnb for food. The disruptive food app for the sharing economy"
        return textView
    }()
    
    //    let acceptButton: UIButton = {
    //        let button = UIButton()
    //        button.setTitle("Accept Meal", for: .normal)
    //        button.layer.cornerRadius = 5
    //        button.layer.borderWidth = 1
    //        button.layer.borderColor = UIHandler.UIConstants.accentColor.cgColor
    //        button.setTitleColor(UIHandler.UIConstants.accentColor, for: .normal)
    //        return button
    //    }()
    //
    //    let priceLabel: UILabel = {
    //        let label = UILabel()
    //        label.font = UIFont(name: UIHandler.UIConstants.standardFontNameBold, size: 24)
    //        return label
    //    }()
    
    
    override func setupViews() {
        super.setupViews()
        backgroundColor = .white
        
        addSubview(profileImageView)
        addSubview(nameLabel)
        addSubview(usernameLabel)
        addSubview(bioTextView)
        //        addSubview(acceptButton)
        //        addSubview(priceLabel)
        
        
        profileImageView.anchor(self.topAnchor, left: self.leftAnchor, bottom: nil, right: nil, topConstant: 12, leftConstant: 12, bottomConstant: 0, rightConstant: 0, widthConstant: 50, heightConstant: 50)
        
        nameLabel.anchor(profileImageView.topAnchor, left: profileImageView.rightAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 8, bottomConstant: 0, rightConstant: 12, widthConstant: 0, heightConstant: 20)
        
        usernameLabel.anchor(nameLabel.bottomAnchor, left: nameLabel.leftAnchor, bottom: nil, right: nameLabel.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 20)
        
        //        priceLabel.anchor(self.topAnchor, left: nil, bottom: nil, right: self.rightAnchor, topConstant: 12, leftConstant: 0, bottomConstant: 0, rightConstant: 12, widthConstant: 0, heightConstant: 20)
        
        //        acceptButton.anchor(priceLabel.bottomAnchor, left: nil, bottom: nil, right: self.rightAnchor, topConstant: 8, leftConstant: 0, bottomConstant: 0, rightConstant: 12, widthConstant: 120, heightConstant: 34)
        
        bioTextView.anchor(usernameLabel.bottomAnchor, left: usernameLabel.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, topConstant: -4, leftConstant: -4, bottomConstant: 0, rightConstant: 12, widthConstant: 0, heightConstant: 0)
    }
}










