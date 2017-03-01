//
//  NewUserControllerViewController.swift
//  LoginAccess
//
//  Created by Diego Souza Sampaio on 17-02-22.
//  Copyright © 2017 Diego Souza Sampaio. All /Users/digdig/Documents/xCode/LoginAccess/LoginAccess/Base.lproj/Main.storyboardrights reserved.
//

import UIKit

class NewUserControllerViewController: UIViewController {
var user:User = User()
    var checkallfieds = false;
    var checkpwds =  false;
 
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "createANewUser"
        {
          
            
            user.firstname = nameNewUser.text ;
            user.lastname = lastnameNewUser.text ;
            user.login =  loginNewUser.text ;
            user.pwd = password2NewUser.text ;
            user.question = questionNewUser.text ;
            user.answer = answerNewUser.text;
              let vc2 = segue.destination as!
            dashBoardViewControllerViewController
            vc2.user = user;
            // vc2.user = user;
            //  vc2.login =  //user.login;
            //  vc2.pwd = user.pwd;
            
            
        }
        
        
    }
    
        
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
 func checkFields()
 {
 if (self.nameNewUser.text != "" && self.lastnameNewUser.text != "" && self.loginNewUser.text != "" && self.password1NewUser.text != "" && self.password2NewUser.text != "" && self.questionNewUser.text != "" && self.answerNewUser.text != "")
   {
 checkallfieds = true
    
    }
    else
 {
    let emptyFieldsMessage = UIAlertController(title:"Fill All information", message:"Please check all fields", preferredStyle: UIAlertControllerStyle.alert)
    emptyFieldsMessage.addAction(UIAlertAction(title:"OK", style:UIAlertActionStyle.default, handler: nil))
    self.present(emptyFieldsMessage, animated:true, completion:nil)
    }
    
}
    
    func checkPwd()
    {
    if (password1NewUser.text ==  self.password2NewUser.text)
    {
       checkpwds = true
        }
        else
    {
        let emptyFieldsMessage = UIAlertController(title:"Password", message:"Please check the Password", preferredStyle: UIAlertControllerStyle.alert)
        emptyFieldsMessage.addAction(UIAlertAction(title:"OK", style:UIAlertActionStyle.default, handler: nil))
        self.present(emptyFieldsMessage, animated:true, completion:nil)
        
        }
    
    }
    

    @IBOutlet weak var loginNewUser: UITextField!
    @IBOutlet weak var answerNewUser: UITextField!
    @IBOutlet weak var questionNewUser: UITextField!
    @IBOutlet weak var password2NewUser: UITextField!
    @IBOutlet weak var password1NewUser: UITextField!

    @IBOutlet weak var nameNewUser: UITextField!
    @IBOutlet weak var lastnameNewUser: UITextField!
    @IBAction func newUser(_ sender: Any) {
        checkFields()
        checkPwd()
        if (checkallfieds && checkpwds)
        {
           performSegue(withIdentifier: "createANewUser", sender: self)
        }
        
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
