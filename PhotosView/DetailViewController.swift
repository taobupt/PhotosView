//
//  DetailViewController.swift
//  PhotosView
//
//  Created by Tao Wang on 1/4/17.
//  Copyright © 2017 Tao Wang. All rights reserved.
//

import UIKit

extension String{
    var length:Int {
        return self.characters.count
    }
    
    func index(of char: Character)-> Int? {
        if let idx=characters.index(of: char){
            return characters.distance(from: startIndex, to: idx)
        }
        return nil
    }
}

class DetailViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var posterImage: UIImageView!
    
    var index:Int!
    var posts: [NSDictionary] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(didTap(sender:)))
        
        // Optionally set the number of required taps, e.g., 2 for a double click
        tapGestureRecognizer.numberOfTapsRequired = 2;
        
        // Attach it to a view of your choice. If it's a UIImageView, remember to enable user interaction
        posterImage.isUserInteractionEnabled = true
        posterImage.addGestureRecognizer(tapGestureRecognizer)
        
        
        
        // bar 
        let titleLabel = UILabel()
        
        let shadow = NSShadow()
        shadow.shadowColor = UIColor.red.withAlphaComponent(0.5)
        shadow.shadowOffset = CGSize(width:2, height:2);
        shadow.shadowBlurRadius = 4;
        
        let titleText = NSAttributedString(string: "detail", attributes: [
            NSFontAttributeName : UIFont.boldSystemFont(ofSize: 28),
            NSForegroundColorAttributeName : UIColor(red: 0.5, green: 0.25, blue: 0.15, alpha: 0.8),
            NSShadowAttributeName : shadow
            ])
        
        titleLabel.attributedText = titleText
        titleLabel.sizeToFit()
        navigationItem.titleView = titleLabel
        
        
    
        
        
        let post=posts[index]
        
        if let photos=post.value(forKeyPath: "photos")as? [NSDictionary]{
            let Url=photos[0].value(forKeyPath: "original_size.url") as? String
            let imageUrl=URL(string: Url!)
            self.posterImage.setImageWith(imageUrl!)
        }
        
        
        
        
        if let trail=post.value(forKeyPath: "trail")as? [NSDictionary]{
            //print(trail[0])
            if let str=trail[0].value(forKeyPath: "content_raw")as? String{
            print(str)
            let start=str.index((str.startIndex), offsetBy: 6)
            let end=str.index(str.endIndex,offsetBy:-9)
            let range=start..<end
            label.text=str.substring(with: range)
            }else{
                label.text="nothing"
            }
    }
        // Do any additional setup after loading the view.
}
    
    func didTap(sender: UITapGestureRecognizer){
        let location=sender.location(in: view)
        print("I have called")
        performSegue(withIdentifier: "FullScreen", sender: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var destinationViewController=segue.destination as! FullScreenPhotoViewController
        destinationViewController.image=self.posterImage.image!
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    

}
