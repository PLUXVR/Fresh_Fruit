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
        let validate: Bool = emailTextField != nil && !emailTextField.text!.isEmpty
        return validate;

    }

    func validatePassword() -> Bool {
        let validate: Bool = passwordTextField != nil && !passwordTextField.text!.isEmpty
        return  validate;
    }

    func registerWithEmailAndPassword(email: String?, password: String?) {
        if email != nil && password != nil {
            authInstance.createUser(withEmail: email!, password: password!) { authResult, error in
                guard let user = authResult?.user, error == nil else {
                    print(error!.localizedDescription)
                    return
                }
                print("User registered: \(user)")
            }

        }
    }
}
