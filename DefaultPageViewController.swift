//
//  DefaultPageViewController.swift
//  Wechat@MU
//
//  Created by LiangLyu on 12/2/16.
//  Copyright © 2016 LiangLyu. All rights reserved.
//

import UIKit

class DefaultPageViewController: UIViewController {
    let url_facebook = NSURL(string: "https://www.facebook.com/MonmouthUniversity")
    let url_Instagram = NSURL(string:"https://www.instagram.com/monmouthuniversity/")
    let url_LinkedIn = NSURL(string:"https://www.linkedin.com/edu/school?id=18861")
    let url_Snapchat = NSURL(string:"https://www.snapchat.com/add/monmouthu")
    let url_Twitter = NSURL(string:"https://twitter.com/monmouthu")
    let url_Youtube = NSURL(string:"https://www.youtube.com/user/monmouthuniversity")

    @IBAction func btnSignIn(sender: UIBarButtonItem) {
        performSegueWithIdentifier("Login", sender: self)
    }
    @IBOutlet weak var lblIntroduction: UILabel!
    @IBOutlet weak var btnLogo: UIButton!
    @IBAction func btnTwitter(sender: UIButton) {
        UIApplication.sharedApplication().openURL(url_Twitter!)
    }
    @IBAction func btnYoutube(sender: UIButton) {
        UIApplication.sharedApplication().openURL(url_Youtube!)
    }
    @IBAction func btnInst(sender: UIButton) {
        UIApplication.sharedApplication().openURL(url_Instagram!)
    }
    @IBAction func btnLinkIn(sender: UIButton) {
        UIApplication.sharedApplication().openURL(url_LinkedIn!)
    }
    @IBAction func btnFacebook(sender: UIButton) {
        UIApplication.sharedApplication().openURL(url_facebook!)
    }
    @IBAction func btnSnapChat(sender: UIButton) {
        UIApplication.sharedApplication().openURL(url_Snapchat!)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Home"
        lblIntroduction.text = "Monmouth’s diverse programs of study and small classes foster a close-knit community of teaching, scholarship, and collaboration. Our campus is located one hour from New York and Philadelphia and at the heart of a vibrant coastal community rich in history, arts, culture and finance."
        lblIntroduction.font = UIFont(name: "AppleSDGothicNeo-Thin", size: 23.0)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
