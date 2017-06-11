//
//  RegisterPageViewController.swift
//  MobileMedic
//
//  Created by Jan Kolenko on 26/04/2017.
//  Copyright © 2017 Tadej Kostanjevec. All rights reserved.
//

import UIKit

class RegisterPageViewController: UIViewController {

    @IBOutlet weak var userEmailTextField: UITextField!
    @IBOutlet weak var userPasswordTextField: UITextField!
    @IBOutlet weak var userRepeatPasswordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func registerButtonTapped(_ sender: Any) {
        
        let userEmail = userEmailTextField.text;
        let userPassword = userPasswordTextField.text;
        let userRepeatPassword = userRepeatPasswordTextField.text;
        
        // Check for empty fields
        if ((userEmail?.isEmpty)! || (userPassword?.isEmpty)! || (userRepeatPassword?.isEmpty)!) {
            // Display alert message
            displayAlertMessage(userMessage: "All fields are required!");
            return;
        }
        
        // Check if passwords match
        if (userPassword != userRepeatPassword)
        {
            // Display alert message
            displayAlertMessage(userMessage: "Password do not match!");
            return;
        }
        
        // Store data
        
        
        // Display alert message with confirmation
    }
    
    func displayAlertMessage(userMessage:String)
    {
        var myAlert = UIAlertController(title:"Alert", message:userMessage, preferredStyle: UIAlertControllerStyle.alert);
        
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
