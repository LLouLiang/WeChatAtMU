//
//  ChatroomRegisterViewController.swift
//  Wechat@MU
//
//  Created by LiangLyu on 12/3/16.
//  Copyright © 2016 LiangLyu. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase

class ChatroomRegisterViewController: UIViewController {

    let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("chatroomLoginView") as! UIViewController
    @IBOutlet weak var txtEmail_name: UITextField!
    @IBOutlet weak var txtPasscode: UITextField!
    @IBOutlet weak var txtPasscode_check: UITextField!
    @IBAction func btnRegister(sender: UIButton) {
        let email = txtEmail_name.text!
        let passcode = txtPasscode.text!
        let passcode_check = txtPasscode_check.text!
        if(passcode != passcode_check){
            loginErrorAlert("Meet error", message: "You need to double check you input")
        }else{
            FIRAuth.auth()?.createUserWithEmail(email, password: passcode, completion: {(user:FIRUser?, error) in
                if(error != nil){
                    self.loginErrorAlert("system error", message: String(error))
                }
            })
            presentViewController(vc, animated: true, completion: nil)
        }
        
    }
    
    func loginErrorAlert(title:String, message:String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        let action = UIAlertAction(title: "Ok", style: .Default, handler: nil)
        alert.addAction(action)
        presentViewController(alert, animated: true, completion: nil)
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
