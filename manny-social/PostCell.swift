//
//  TableViewCell.swift
//  manny-social
//
//  Created by Emmanuel Erilibe on 1/15/17.
//  Copyright © 2017 Emmanuel Erilibe. All rights reserved.
//

import UIKit
import Firebase

class PostCell: UITableViewCell {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var postImg: UIImageView!
    @IBOutlet weak var caption: UITextView!
    @IBOutlet weak var likesLabel: UILabel!
    
    var post: Post!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    

    func configureCell(post: Post, img: UIImage? = nil) {
        self.post = post
        self.caption.text = post.caption
        self.likesLabel.text = "\(post.likes)"
        
        if img != nil {
            
            self.postImg.image = img
            
        } else {
            
            let ref = FIRStorage.storage().reference(forURL: post.imageUrl)
            
            ref.data(withMaxSize: 2 * 1024 * 1024, completion: { (data, error) in
                
                if error != nil {
                    
                    print("MANNY: Unable to download image from Firebase storage")
                } else {
                    
                    print("MANNY: image downloaded from Firebase storage")
                    
                    if let imgData = data {
                        
                        if let img = UIImage(data: imgData){
                            
                            self.postImg.image = img
                            
                            FeedVC.imageCache.setObject(img, forKey: post.imageUrl as NSString)
                            
                        }
                    }
                }
            })
        }
    }
}
