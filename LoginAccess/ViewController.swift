//
//  ViewController.swift
//  LoginAccess
//
//  Created by Diego Souza Sampaio on 17-02-20.
//  Copyright © 2017 Diego Souza Sampaio. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    /*var user:User = User(firstname:"Diego",lastname:" Sampaio",login:"dig",pwd:"dig",question:"nickname",answer:"answer") */
    
        var user:User = User()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkLabelHome.text="";
        loginHomeLabel.text=""
    switchPwd.isOn = UserDefaults.standard.bool(forKey: "switchON")
        if (switchPwd.isOn)
        {
            loginHomeLabel.text = user.login;
            passwordLabelHome.text = user.pwd;
        }
        
        // Do any additional setup after loading the view, typically from a nib.
     
    }
 
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "forgot"
        {
            let vc2 = segue.destination as!
            ForgotPwdViewController
            vc2.user = user;
           // vc2.user = user;
          //  vc2.login =  //user.login;
          //  vc2.pwd = user.pwd;
       
            
        }
  if segue.identifier == "login"
  {
                let vc = segue.destination as!
            dashBoardViewControllerViewController
               vc.user = user;
    
               // let login_system = user.login;
                //let pwd_system = user.pwd;
               // vc.login = login_system;
              //  vc.pwd = pwd_system;
               // vc.firstname = user.firstname;
              //  vc.lastname = user.lastname;
    }
       
        
      
 }
    
    @IBAction func OnClickLogin(_ sender: Any) {
     
        if loginHomeLabel.text == user.login && passwordLabelHome.text == user.pwd
        {
                  performSegue(withIdentifier: "login", sender: self)
        }
            else
            {
                checkLabelHome.text = "Sorry problem with Pwd or Login"
            }
            
        
 
    }


    
    @IBAction func ForgotClick(_ sender: Any) {
        if loginHomeLabel.text == ""
        {
            checkLabelHome.text = "Please Type the Login!"
        }
        else
            if loginHomeLabel.text != user.login
            {
                checkLabelHome.text = "Sorry Login not found!"
            }
            else
                if loginHomeLabel.text == user.login
                    
                {
                    performSegue(withIdentifier: "forgot", sender: self)
        }
    }
    

    @IBOutlet weak var switchPwd: UISwitch!
    @IBAction func keepPwd(_ sender: Any) {
        UserDefaults.standard.set(switchPwd.isOn, forKey: "switchON")
        

    }
    @IBOutlet weak var checkLabelHome: UILabel!
    @IBOutlet weak var passwordLabelHome: UITextField!
    @IBOutlet weak var loginHomeLabel: UITextField!
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

