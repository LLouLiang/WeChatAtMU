//
//  ChatroomLoginInViewController.swift
//  Wechat@MU
//
//  Created by LiangLyu on 12/3/16.
//  Copyright © 2016 LiangLyu. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class ChatroomLoginInViewController: UIViewController {

    let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("chatroomView") as! UISplitViewController
    @IBAction func loginIn(sender: UIBarButtonItem) {
        self.presentViewController(vc, animated: true, completion: nil)
    }
    @IBOutlet weak var accountName: UITextField!
    @IBOutlet weak var accountPasscode: UITextField!
    @IBAction func btnLogin(sender: UIButton) {
        let login_name = accountName.text!
        let login_password = accountPasscode.text!
        
        if(login_name != "" && login_password != ""){
            FIRAuth.auth()?.signInWithEmail(login_name, password: login_password, completion: {user,error
                in
                if(error == nil){
                    self.presentViewController(self.vc, animated: true, completion: nil)
                }else{
                    self.loginErrorAlert("err", message: (error?.localizedDescription)!)
                    
                }
            })
        }else{
            loginErrorAlert("err", message: "Need a account??")
        }

    }
    func loginErrorAlert(title:String, message:String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        let action = UIAlertAction(title: "Ok", style: .Default, handler: nil)
        alert.addAction(action)
        presentViewController(alert, animated: true, completion: nil)
    }
    @IBAction func btnCreate(sender: UIButton) {
        performSegueWithIdentifier("creating", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 61/266, green: 91/255, blue: 151/255, alpha: 1)

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
