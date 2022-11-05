import UIKit
import FirebaseAuth

class RegViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    let authInstance: Auth = Auth.auth()
    let backgroundImageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackground()
    }
    
    
    // Background setting
    
    func setBackground() {
        view.addSubview(backgroundImageView)
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        backgroundImageView.image = UIImage(named: "Fruits")
        
        backgroundImageView.frame = self.view.bounds
        backgroundImageView.blurImage()
        self.view.addSubview(self.backgroundImageView)
        
        
        view.sendSubviewToBack(backgroundImageView)
    }
    
    @IBAction func GoogleRegistration(_ sender: Any) {
    }
    
    @IBAction func getStarted(_ sender: Any) {
        if (validateEmail() && validatePassword()) {
            registerWithEmailAndPassword(email: emailTextField!.text, password: passwordTextField!.text)
        }
    }
    
    func validateEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        let validate: Bool = emailTextField != nil && !emailTextField.text!.isEmpty && emailPred.evaluate(with: emailTextField.text)
        
        if !validate {
            self.showMessagePrompt("Incorrect email format. Example format: user@example.com")
        }
        
        return validate;
    }
    
    func validatePassword() -> Bool {
        let passwordRegEx = "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{6,}$"
        let passwordPredicate = NSPredicate(format:"SELF MATCHES %@", passwordRegEx)
        let validate: Bool = passwordTextField != nil && !passwordTextField.text!.isEmpty &&
        passwordPredicate.evaluate(with: passwordTextField.text)
        
        if !validate {
            self.showMessagePrompt("Password must contain minimum 6 characters at least 1 alphabe and 1 number")
        }
        
        return  validate;
    }
    
    func registerWithEmailAndPassword(email: String?, password: String?) {
        if email != nil && password != nil {
            self.showSpinner { [self] in
                authInstance.createUser(withEmail: email!, password: password!) { authResult, error in
                    self.hideSpinner {
                        guard let user = authResult?.user, error == nil else {
                            self.showMessagePrompt(error!.localizedDescription)
                            return
                        }
                        self.showMessagePrompt("User successfully registered with email: \(user.email!)")
                    }
                }
            }
        }
    }
}
