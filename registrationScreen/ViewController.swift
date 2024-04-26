import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var registerButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.keyboardType = .default
        
        emailTextField.keyboardType = .emailAddress
        
        passwordTextField.keyboardType = .default
        passwordTextField.isSecureTextEntry = true
        
        nameTextField.delegate = self
        emailTextField.delegate = self
        passwordTextField.delegate = self
        
        registerButton.isEnabled = false
        registerButton.setTitleColor(.white.withAlphaComponent(0.4), for: .disabled)
        registerButton.setTitleColor(.white, for: .normal)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
                view.addGestureRecognizer(tapGesture)
    }
    
    
    @IBAction func tappedRegisterButton(_ sender: UIButton) {
        print("botão")
    }
    
    func validateTextField() {
        let nameCount = nameTextField.text?.count ?? 0
        let emailCount = emailTextField.text?.count ?? 0
        let passwordCount = passwordTextField.text?.count ?? 0

        if nameCount > 0 && emailCount > 0 && passwordCount > 0 {
            registerButton.isEnabled = true
        } else {
            registerButton.isEnabled = false
        }
    }
    
    @objc func dismissKeyboard() {
            view.endEditing(true)
        }
}

extension ViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print(#function)
        textField.layer.borderColor = UIColor.blue.cgColor
        textField.layer.borderWidth = 1
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        print(#function)
        textField.layer.borderWidth = 0
        validateTextField()
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        print(#function)
        validateTextField()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print(#function)
        textField.resignFirstResponder()
        return true
    }
}
