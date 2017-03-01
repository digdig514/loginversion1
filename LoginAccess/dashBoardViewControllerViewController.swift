//
//  dashBoardViewControllerViewController.swift
//  LoginAccess
//
//  Created by Diego Souza Sampaio on 17-02-22.
//  Copyright © 2017 Diego Souza Sampaio. All rights reserved.
//

import UIKit

class dashBoardViewControllerViewController: UIViewController {

      var user:User = User()
    var checkUpdate =  false;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //loginDashboardLabel.isUserInteractionEnabled = false;
        //pwdDashboardLabel.isUserInteractionEnabled = false;
        loginLabel.text = user.firstname! + " " + user.lastname!;
        loginDashboardLabel.text = user.login;
        pwdDashboardLabel.text = user.pwd;
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
 
    
    @IBAction func TouchUpUpdate(_ sender: Any) {
    //var user2:User = User()
     user.login = loginDashboardLabel.text!;
     user.pwd = pwdDashboardLabel.text!;
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "logout"{
            let vc = segue.destination as!
            ViewController
            vc.user = user;
            
            
        }
    }
    @IBAction func UpdateInfo(_ sender: Any) {
        
        if (self.loginDashboardLabel.text != "" && self.pwdDashboardLabel.text != "" )
        {
            checkUpdate =  true;
            if (checkUpdate)
            {
                user.login = loginDashboardLabel.text;
                user.pwd = pwdDashboardLabel.text;
            }
            
        }
        else
        {
            let emptyFieldsMessage = UIAlertController(title:"Fill All information", message:"Please check all fields", preferredStyle: UIAlertControllerStyle.alert)
            emptyFieldsMessage.addAction(UIAlertAction(title:"OK", style:UIAlertActionStyle.default, handler: nil))
            self.present(emptyFieldsMessage, animated:true, completion:nil)
        }
        }
    
    @IBOutlet weak var loginDashboardLabel: UITextField!
   
    @IBOutlet weak var pwdDashboardLabel: UITextField!
@IBOutlet weak var loginLabel: UILabel!
}

       /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

