//
//  LoginViewController.swift
//  Iani_Maria_333
//
//  Created by user216460 on 5/3/22.
//

import UIKit
import Firebase
import FirebaseAuth

class LoginViewController: UIViewController {

    
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var login: UIButton!
    @IBOutlet weak var error: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func loginPressed(_ sender: Any) {
            
            // TODO: Validate Text Fields
            
            // Create cleaned versions of the text field
            let email = email.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = password.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            // Signing in the user
            Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
                
                if error != nil {
                    // Couldn't sign in
                    self.error.text = error!.localizedDescription
                    self.error.alpha = 1
                }
                else {
                    
                    let hotelViewController = self.storyboard?.instantiateViewController(identifier: "HomeVC") as? HotelViewController
                    
                    self.view.window?.rootViewController = hotelViewController
                    self.view.window?.makeKeyAndVisible()
                }
            }
        }
    
}
