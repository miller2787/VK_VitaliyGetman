//
//  ViewController.swift
//  VK_VitaliyGetman
//
//  Created by Гетьман Виталий on 29.05.2022.
//

import UIKit


class LoginViewController: UIViewController {

    
    
    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var autorizationLabel: UILabel!
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var registrationButton: UIButton!
    @IBOutlet weak var scrollView: UIScrollView!
    
    
    let toTabBarController = "toTabBarController"
    

    override func viewDidLoad() {
        super.viewDidLoad()

        let recognizer = UITapGestureRecognizer(target: self, action: #selector(onTap(_:)))
        self.view.addGestureRecognizer(recognizer)
    
    }

    @objc func onTap(_ sender: Any) {
        self.view.endEditing(true)
        print("tap")
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("willAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("didAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("willDisappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("didDisappear")
    }
    
    func fillData() -> [Friend] {
        let myPhoto1 = MyPhoto(url: "petya")
        let myPhoto2 = MyPhoto(url: "sveta")
        let myPhoto3 = MyPhoto(url: "ivan")
        
        let friend1 = Friend(name: "Пётр", lastName: "Петров", age: "15", avatar: "petya", fotoAlbum: [myPhoto3])
        let friend2 = Friend(name: "Света", lastName: "Светова", age: "16", avatar: "sveta", fotoAlbum: [myPhoto1, myPhoto2, myPhoto3])
        let friend3 = Friend(name: "Иван", lastName: "Иванов", age: "25", avatar: "ivan", fotoAlbum: [myPhoto2])

        var friendsArray = [Friend]()
        
        friendsArray.append(friend1)
        friendsArray.append(friend2)
        friendsArray.append(friend3)
        
        return friendsArray
    }
    

    @IBAction func loginButtonPressed(_ sender: UIButton) {

        UIView.animateKeyframes(withDuration: 2,
                                delay: 0,
                                options: []) {
            UIView.addKeyframe(withRelativeStartTime: 0,
                               relativeDuration: 1) {
                [weak self] in
                
                self?.logo.transform = CGAffineTransform.init(translationX: -450, y: -300)
             self?.autorizationLabel.transform = CGAffineTransform.init(translationX: 450, y: -300)
                
                self?.loginLabel.transform = CGAffineTransform.init(translationX: 450, y: 0)
             self?.passwordLabel.transform = CGAffineTransform.init(translationX: 450, y: 0)
                
                self?.userNameTextField.transform = CGAffineTransform.init(translationX: -450, y: 0)
             self?.passwordTextField.transform = CGAffineTransform.init(translationX: -450, y: 0)
                
                   self?.loginButton.transform = CGAffineTransform.init(translationX: 0, y: 600)
                self?.registrationButton.transform = CGAffineTransform.init(translationX: 0, y: 600)
            }
        } completion: {
            [weak self] _ in
            guard let self = self else { return }
            self.performSegue(withIdentifier: self.toTabBarController, sender: nil)
           
        }
        Storage.shared.friends = fillData()
        
        
        func keyboardWillShow (notification: Notification) {
                let info = notification.userInfo! as NSDictionary
                let keyboardSize = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue).cgRectValue.size
                let contentInset = UIEdgeInsets(top: 0.0, left: 0.0, bottom: keyboardSize.height, right: 0.0)
                scrollView.contentInset = contentInset
                scrollView.scrollIndicatorInsets = contentInset
            }
            
        func keyboardWasHide (notification: Notification) {
                let contentInset = UIEdgeInsets.zero
                scrollView.contentInset = contentInset
            }
            
        func hideKeyboard(){
                scrollView.endEditing(true)
            }
            
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
                if textField == userNameTextField {
                    passwordTextField.becomeFirstResponder()
        } else {
            loginButton.self
                }
                return true
        }
        
        
        
        
        
        
        
        
        
        
//
//        if let login = userNameTextField.text, login == "vg" {
//            userNameTextField.backgroundColor = UIColor.systemBlue
//        } else {
//            userNameTextField.backgroundColor = UIColor.gray
//        }
//
//        if let password = passwordTextField.text, password == "111" {
//            passwordTextField.backgroundColor = UIColor.systemBlue
//        } else {
//            passwordTextField.backgroundColor = UIColor.gray
//        }
//
//        Storage.shared.friends = fillData()
//        performSegue(withIdentifier: toTabBarController, sender: nil)
//    }
        
    }
}
