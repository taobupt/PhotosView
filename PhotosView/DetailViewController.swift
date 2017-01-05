//
//  DetailViewController.swift
//  PhotosView
//
//  Created by Tao Wang on 1/4/17.
//  Copyright © 2017 Tao Wang. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    var index:Int!
    var posts: [NSDictionary] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        let post=posts[index]
        if let trail=post.value(forKeyPath: "trail")as? [NSDictionary]{
            //print(trail[0])
            if let str=trail[0].value(forKeyPath: "content_raw")as? String{
            print(str)
            let start=str.index((str.startIndex), offsetBy: 6)
            let end=str.index((str.endIndex), offsetBy: -9)
            let range=start..<end
            label.text=str.substring(with: range)
            }else{
                label.text="nothing"
            }
    }
        // Do any additional setup after loading the view.
}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
