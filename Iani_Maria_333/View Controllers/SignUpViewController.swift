//
//  SignUpViewController.swift
//  Iani_Maria_333
//
//  Created by user216460 on 5/3/22.
//

import UIKit
import Firebase
import FirebaseAuth

class SignUpViewController: UIViewController {
    
    
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var phoneNumber: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var signUp: UIButton!
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
    
    func isPasswordValid(_ password : String) -> Bool {
            
            let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}")
            return passwordTest.evaluate(with: password)
    }
    
    
    func validateFields() -> String? {
            
            // Check that all fields are filled in
            if firstName.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
                lastName.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
                email.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
                password.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
                
                return "Please fill in all fields."
            }
            
            // Check if the password is secure
            let cleanedPassword = password.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            if isPasswordValid(cleanedPassword) == false {
                // Password isn't secure enough
                return "Please make sure your password is at least 8 characters, contains a special character and a number."
            }
            
            return nil
    }
    
    func showError(_ message:String) {
            
            error.text = message
            error.alpha = 1
    }
    
    func transitionToHome() {
            
        let HotelViewController = storyboard?.instantiateViewController(identifier: "HomeVC") as? HotelViewController
            
            view.window?.rootViewController = HotelViewController
            view.window?.makeKeyAndVisible()
            
    }
    
    @IBAction func signUpPressed(_ sender: Any) {
        
        let error = validateFields()
                
                if error != nil {
                    
                    // There's something wrong with the fields, show error message
                    showError(error!)
                }
                else {
                    
                    // Create cleaned versions of the data
                    let firstName = firstName.text!.trimmingCharacters(in: .whitespacesAndNewlines)
                    let lastName = lastName.text!.trimmingCharacters(in: .whitespacesAndNewlines)
                    let email = email.text!.trimmingCharacters(in: .whitespacesAndNewlines)
                    let password = password.text!.trimmingCharacters(in: .whitespacesAndNewlines)
                    
                    // Create the user
                    Auth.auth().createUser(withEmail: email, password: password) { (result, err) in
                        
                        // Check for errors
                        if err != nil {
                            
                            // There was an error creating the user
                            self.showError("Error creating user")
                        }
                        else {
                            
                            // User was created successfully, now store the first name and last name
                            let db = Firestore.firestore()
                            
                            db.collection("users").addDocument(data: ["email": email, "firstname":firstName, "lastname":lastName, "uid": result!.user.uid ]) { (error) in
                                
                                if error != nil {
                                    // Show error message
                                    self.showError("Error saving user data")
                                }
                            }
                            
                            // Transition to the home screen
                            self.transitionToHome()
                        }
                        
                    }
                    
                    
                    
                }
    }
    

}




