//
//  FullScreenPhotoViewController.swift
//  PhotosView
//
//  Created by Tao Wang on 1/13/17.
//  Copyright © 2017 Tao Wang. All rights reserved.
//

import UIKit

class FullScreenPhotoViewController: UIViewController,UIScrollViewDelegate {

    @IBOutlet weak var infoView: UIView!
    
    @IBOutlet weak var scrollview: UIScrollView!
    @IBOutlet weak var posterImage: UIImageView!
    
    @IBOutlet weak var dismissButton: UIButton!
    var image: UIImage?
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollview.delegate=self
        
        scrollview.contentSize=CGSize(width: scrollview.frame.width, height: infoView.frame.origin.y+infoView.frame.size.height)
        dismissButton.addTarget(self, action: #selector(FullScreenPhotoViewController.back), for: .touchDown)
        
        
        posterImage.image=image
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func back(){
        print("back has been called")
        dismiss(animated: true, completion: nil)
    }
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return posterImage
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
