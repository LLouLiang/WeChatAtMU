//
//  VistSceneViewController.swift
//  Wechat@MU
//
//  Created by LiangLyu on 12/6/16.
//  Copyright © 2016 LiangLyu. All rights reserved.
//

import UIKit

class VistSceneViewController: UIViewController {

    @IBAction func btnMap(sender: UIBarButtonItem) {
        performSegueWithIdentifier("map", sender: self)
    }
    @IBOutlet weak var sceneImage: UIImageView!
    var selectedScene: Dictionary<String, AnyObject> = Dictionary<String, AnyObject>()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let imagename: String = (selectedScene["id"] as? String)! + ".png"
        sceneImage.image = UIImage(named: imagename)
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "map") {
            let dvc = segue.destinationViewController as! MapViewController
            dvc.selectedimage = selectedScene
        }
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
