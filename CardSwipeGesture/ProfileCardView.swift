//
//  CardView.swift
//  CardSlider
//
//  Created by iPHTechnologies pvt ltd on 30/06/2023.
//  Copyright © 2023 iPHTechnologies pvt ltd. All rights reserved.
//

import UIKit

public enum Reaction: String {
    case like = "like"
    case nope = "nope"
}

class CustomProfileView: UIView {
    
    var likeImageView: CardImageView!
    var dislikeImageView: CardImageView!
    
    var crossBtn: CardViewButton!
    var checkBtn: CardViewButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
       
        self.backgroundColor = .darkGray
        self.layer.cornerRadius = 10
        let padding: CGFloat = 140
        
        likeImageView = CardImageView(origin: CGPoint(x: padding, y: padding+100), color: UIColor(red: 102/255, green: 209/255, blue: 158/255, alpha: 1.0))

        likeImageView.isHidden = true
        self.addSubview(likeImageView)

        dislikeImageView = CardImageView(origin: CGPoint(x: frame.width - CardViewLabel.size.width + 20 - padding, y: padding + 100), color: UIColor(red: 236/255, green: 137/255, blue: 134/255, alpha: 1.0))
        dislikeImageView.isHidden = true
        self.addSubview(dislikeImageView)
        
        crossBtn = CardViewButton(origin: CGPoint(x: frame.width - CardViewLabel.size.width + 20 - padding, y: padding+100), color: UIColor(red: 236/255, green: 137/255, blue: 134/255, alpha: 1.0))
        crossBtn.backgroundColor = UIColor(patternImage: UIImage(named: "check")!)
        let image = UIImage(named: "cross")
        crossBtn.setBackgroundImage(image, for: UIControl.State.normal)
        crossBtn.isHidden = true
        self.addSubview(crossBtn)
        
        checkBtn = CardViewButton(origin: CGPoint(x: frame.width - CardViewLabel.size.width - padding, y: padding+100), color: UIColor(red: 236/255, green: 137/255, blue: 134/255, alpha: 1.0))
        checkBtn.isHidden = true
        let image1 = UIImage(named: "check")
        crossBtn.setBackgroundImage(image1, for: UIControl.State.normal)
        self.addSubview(checkBtn)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func showLabel(option: Reaction) {
        if option == .like {
            
            likeImageView.image = UIImage(named: "check")
            likeImageView.contentMode = .scaleToFill
            
            if !dislikeImageView.isHidden {
                UIView.animate(withDuration: 0.15, animations: {
                    self.dislikeImageView.alpha = 0
                }, completion: { (_) in
                    self.dislikeImageView.isHidden = true
                })
            }
            
            if likeImageView.isHidden {
                likeImageView.alpha = 0
                likeImageView.isHidden = false
                UIView.animate(withDuration: 0.2, animations: { 
                    self.likeImageView.alpha = 1
                })
            }
            
        } else {
            
            dislikeImageView.image = UIImage(named: "cross")
            dislikeImageView.contentMode = .scaleToFill
            
            
            if !likeImageView.isHidden {
                UIView.animate(withDuration: 0.15, animations: {
                    self.likeImageView.alpha = 0
                }, completion: { (_) in
                    self.likeImageView.isHidden = true
                })
            }
            
            if dislikeImageView.isHidden {
                dislikeImageView.alpha = 0
                dislikeImageView.isHidden = false
                UIView.animate(withDuration: 0.2, animations: {
                    self.dislikeImageView.alpha = 1
                })
            }
        }
    }
    
    var isHidingOptionLabel = false
    
    func hideImage() {
        if !likeImageView.isHidden {
            if isHidingOptionLabel { return }
            isHidingOptionLabel = true
            UIView.animate(withDuration: 0.15, animations: {
                self.likeImageView.alpha = 0
            }, completion: { (_) in
                self.likeImageView.isHidden = true
                self.isHidingOptionLabel = false
            })
        }
        if !dislikeImageView.isHidden {
            if isHidingOptionLabel { return }
            isHidingOptionLabel = true
            UIView.animate(withDuration: 0.15, animations: {
                self.dislikeImageView.alpha = 0
            }, completion: { (_) in
                self.dislikeImageView.isHidden = true
                self.isHidingOptionLabel = false
            })
        }
    }

    
    func showButton(option: Reaction) {
        if option == .like {
        
            if !crossBtn.isHidden {
                UIView.animate(withDuration: 0.15, animations: {
                    self.crossBtn.alpha = 0
                }, completion: { (_) in
                    self.crossBtn.isHidden = true
                })
            }
            
            if checkBtn.isHidden {
                checkBtn.alpha = 0
                checkBtn.isHidden = false
                UIView.animate(withDuration: 0.2, animations: {
                    self.checkBtn.alpha = 1
                })
            }
            
        } else {
            
            let image = UIImage(named: "cross")
            crossBtn.setBackgroundImage(image, for: UIControl.State.normal)
            
            if !checkBtn.isHidden {
                UIView.animate(withDuration: 0.15, animations: {
                    self.checkBtn.alpha = 0
                }, completion: { (_) in
                    self.checkBtn.isHidden = true
                })
            }
            
            if crossBtn.isHidden {
                crossBtn.alpha = 0
                crossBtn.isHidden = false
                UIView.animate(withDuration: 0.2, animations: {
                    self.crossBtn.alpha = 1
                })
            }
        }
    }
    
    var isHidingOptionButton = false
    
    func hideOptionButton() {
        if !checkBtn.isHidden {
            if isHidingOptionButton { return }
            isHidingOptionButton = true
            UIView.animate(withDuration: 0.15, animations: {
                self.checkBtn.alpha = 0
            }, completion: { (_) in
                self.checkBtn.isHidden = true
                self.isHidingOptionButton = false
            })
        }
        if !checkBtn.isHidden {
            if isHidingOptionButton { return }
            isHidingOptionButton = true
            UIView.animate(withDuration: 0.15, animations: {
                self.crossBtn.alpha = 0
            }, completion: { (_) in
                self.crossBtn.isHidden = true
                self.isHidingOptionButton = false
            })
        }
    }
    
}

class CardViewLabel: UILabel {
    fileprivate static let size = CGSize(width: 150, height: 150)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.textColor = .white
        self.font = UIFont.boldSystemFont(ofSize: 18)
        self.textAlignment = .center
        
        self.layer.cornerRadius = frame.height / 2
        self.layer.masksToBounds = true
        self.layer.zPosition = CGFloat(Float.greatestFiniteMagnitude)
    }
    
    convenience init(origin: CGPoint, color: UIColor) {
        
        self.init(frame: CGRect(x: origin.x, y: origin.y, width: CardViewLabel.size.width, height: CardViewLabel.size.height))
        self.backgroundColor = color
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) not implemented")
    }

}

class CardImageView: UIImageView {
    fileprivate static let size = CGSize(width: 150, height: 150)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layer.cornerRadius = frame.height / 2
        self.layer.masksToBounds = true
        self.layer.zPosition = CGFloat(Float.greatestFiniteMagnitude)
    }
    
    convenience init(origin: CGPoint, color: UIColor) {
        
        self.init(frame: CGRect(x: origin.x, y: origin.y, width: CardViewLabel.size.width, height: CardViewLabel.size.height))
        self.backgroundColor = color
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:)  not  implemented")
    }

}


class CardViewButton: UIButton {
    fileprivate static let size = CGSize(width: 120, height: 36)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    convenience init(origin: CGPoint, color: UIColor) {
        
        self.init(frame: CGRect(x: origin.x, y: origin.y, width: CardViewLabel.size.width, height: CardViewLabel.size.height))
        self.backgroundColor = color
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:)  not implemented")
    }

}
