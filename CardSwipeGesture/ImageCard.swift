//
//  ImageCard.swift
//  CardSlider
//
//  Created by iPHTechnologies pvt ltd on 30/06/2023.
//  Copyright © 2023 iPHTechnologies pvt ltd. All rights reserved.
//

import UIKit

class ProfileImageCard: CustomProfileView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    func addImage(imageName: String, name: String, age: Int) {
        let imageView = UIImageView(image: UIImage(named: imageName))
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = UIColor(red: 67/255, green: 79/255, blue: 182/255, alpha: 1.0)
        imageView.layer.cornerRadius = 5
        imageView.layer.masksToBounds = true
        
        imageView.frame = CGRect(x: 2, y: 2, width: self.frame.width - 4, height: self.frame.height - 4)
        self.addSubview(imageView)
        
        let nameLabel = UILabel(frame: CGRect(x: -115, y: self.frame.height - 65, width: self.frame.width - 10, height: 20))
        nameLabel.textAlignment = .center
        nameLabel.textColor = .white
        nameLabel.text = name
        nameLabel.font = UIFont.boldSystemFont(ofSize: 25)
        self.addSubview(nameLabel)
        
        
        let ageLabel = UILabel(frame: CGRect(x: -125, y: self.frame.height - 40, width: self.frame.width - 10, height: 25))
        ageLabel.textAlignment = .center
        ageLabel.textColor = .white
        ageLabel.text = "Age: \(age)"
        ageLabel.font = UIFont.boldSystemFont(ofSize: 25)
        self.addSubview(ageLabel)
        
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:)  not implemented")
    }
    
}
