//
//  Icon.swift
//  AlbumApp
//
//  Created by Axel Kaliff on 2018-08-24.
//  Copyright © 2018 Pavel Bogart. All rights reserved.
//

import Foundation
import UIKit

//meal cell

class MealCell: UICollectionViewCell {
    
    var datasourceItem: Any? {
        didSet {
            print("did set datasourceitem")
            guard let meal = datasourceItem as? Meal else {print("was not user"); return}
            
            let attributedText = NSMutableAttributedString(string: meal.user.username, attributes: [NSAttributedStringKey.font: UIFont(name: UIHandler.UIConstants.standardFontNameBold, size: 16)!])
            
            attributedText.append(NSMutableAttributedString(string: "\n"))
            
            attributedText.append(NSMutableAttributedString(string: meal.description, attributes: [NSAttributedStringKey.font: UIFont(name: UIHandler.UIConstants.standardFontName, size: 14)!]))
            
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineSpacing = 4
            let range = NSMakeRange(0, attributedText.mutableString.length)
            attributedText.addAttribute(NSAttributedStringKey.paragraphStyle, value: paragraphStyle, range: range)
            
            bioTextView.attributedText = attributedText
        }
    }
    
    
    let mealImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "dishImage")
        
        imageView.layer.cornerRadius = 5
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    let bioTextView: UITextView = {
        let tv = UITextView()
        tv.text = "HEllo"
        return tv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    func setup() {
        layer.cornerRadius = 15
        
        backgroundColor = .white
        layer.borderColor = UIColor.lightGray.cgColor
        
        addSubview(mealImageView)
        addSubview(bioTextView)
        
        mealImageView.anchor(self.topAnchor, left: self.leftAnchor, bottom: nil, right: nil, topConstant: 12, leftConstant: 12, bottomConstant: 0, rightConstant: 0, widthConstant: 50, heightConstant: 50)
        
        bioTextView.anchor(topAnchor, left: mealImageView.rightAnchor, bottom: self.bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 1, rightConstant: 0, widthConstant: 50, heightConstant: 0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
