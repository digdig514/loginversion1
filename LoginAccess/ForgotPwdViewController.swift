//
//  ForgotPwdViewController.swift
//  LoginAccess
//
//  Created by Diego Souza Sampaio on 17-02-22.
//  Copyright © 2017 Diego Souza Sampaio. All rights reserved.
//

import UIKit

class ForgotPwdViewController: UIViewController {

    var user:User = User()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        QuestionLabel.text = user.question;
        loginLabel.text = user.login;
        loginLabel.isUserInteractionEnabled = false;
        // Do any additional setup after loading the view.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "updatePwd"
        {
            
            
            user.pwd = pwdLabel1.text;
            let vc2 =  segue.destination as!
            dashBoardViewControllerViewController
            vc2.user = user;
            
            
        }
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func ReturnUpdateForgot(_ sender: Any) {
        if (self.answerLabel.text == user.answer)
        {
            
            if (self.pwdLabel1.text != "" && self.pwdLabel2.text != "")
            {
            
            if (self.pwdLabel1.text == self.pwdLabel2.text)
            {
                performSegue(withIdentifier: "updatePwd", sender: self)
            }
            else
            {
                let emptyFieldsMessage = UIAlertController(title:"Fill All information", message:"Please check all fields", preferredStyle: UIAlertControllerStyle.alert)
                emptyFieldsMessage.addAction(UIAlertAction(title:"OK", style:UIAlertActionStyle.default, handler: nil))
                self.present(emptyFieldsMessage, animated:true, completion:nil)
            }
        
            }
            else
            {
                let emptyFieldsMessage = UIAlertController(title:"Fill All information", message:"Please check the PWD", preferredStyle: UIAlertControllerStyle.alert)
                emptyFieldsMessage.addAction(UIAlertAction(title:"OK", style:UIAlertActionStyle.default, handler: nil))
                self.present(emptyFieldsMessage, animated:true, completion:nil)
            }
        }
        else
        {
            let emptyFieldsMessage = UIAlertController(title:"Fill All information", message:"Please check all fields", preferredStyle: UIAlertControllerStyle.alert)
            emptyFieldsMessage.addAction(UIAlertAction(title:"OK", style:UIAlertActionStyle.default, handler: nil))
            self.present(emptyFieldsMessage, animated:true, completion:nil)
        }
    }
   @IBOutlet weak var QuestionLabel: UILabel!
    @IBOutlet weak var answerLabel: UITextField!
    @IBOutlet weak var loginLabel: UITextField!
    @IBOutlet weak var pwdLabel1: UITextField!
    @IBOutlet weak var pwdLabel2: UITextField!
    @IBAction func returnUpdateButton(_ sender: Any) {
        
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
