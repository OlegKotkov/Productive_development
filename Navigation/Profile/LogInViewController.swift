
import UIKit

class LogInViewController: UIViewController {

    let radius: CGFloat = 10.0
    let textFieldHeight: CGFloat = 50.0
    let margin: CGFloat = 16.0
   
    
    
    var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
         
         scrollView.translatesAutoresizingMaskIntoConstraints = false
         scrollView.backgroundColor = .white
         scrollView.contentInset.bottom = .zero

         return scrollView
     }()
    
    var contentView: UIView = {
         let contentView = UIView()
         contentView.translatesAutoresizingMaskIntoConstraints = false
        return contentView
}()
    
    var logoImageView: UIImageView = {
        
        let logoImageView = UIImageView(image:UIImage(named: "logo"))
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        logoImageView.clipsToBounds = true
        return logoImageView
    }()
    
    var emailTextField: UITextField = {
        let emailTextField = UITextField()
        emailTextField.placeholder = "Email or phone"
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.backgroundColor = UIColor.systemGray6
        emailTextField.textColor = .black
        
        emailTextField.autocapitalizationType = .none
        emailTextField.font = UIFont.systemFont(ofSize: 16)
        emailTextField.layer.borderWidth = 1.0
        emailTextField.layer.borderColor = UIColor.lightGray.cgColor
        emailTextField.keyboardType = UIKeyboardType.default
        return emailTextField
        
    }()

    
     var passwordTextField: UITextField = {
        let passwordTextField = UITextField()
        
        passwordTextField.placeholder = "Password"
         passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.isSecureTextEntry = true
         passwordTextField.backgroundColor = UIColor.systemGray6
         passwordTextField.textColor = .black
         
         passwordTextField.autocapitalizationType = .none
         passwordTextField.font = UIFont.systemFont(ofSize: 16)
         passwordTextField.layer.borderWidth = 1.0
         passwordTextField.layer.borderColor = UIColor.lightGray.cgColor
         passwordTextField.keyboardType = UIKeyboardType.default
        return passwordTextField
    }()
    
    private lazy var inputFieldsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = -1.0
        stackView.axis = .vertical
        stackView.addArrangedSubview(emailTextField)
        stackView.addArrangedSubview(passwordTextField)
        
        stackView.layer.masksToBounds = true
        stackView.layer.borderColor = UIColor.lightGray.cgColor
        stackView.layer.borderWidth = 1.0
        stackView.layer.cornerRadius = radius
        
        return stackView
    }()
    
    private lazy var loginButton: UIButton = {
        let loginButton = UIButton()
        
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.setTitle("Log in", for: .normal)
        loginButton.setTitleColor(.white, for: .normal)
        loginButton.setTitleColor(UIColor(white: 1, alpha: 0.8), for: .disabled)
        loginButton.setTitleColor(UIColor(white: 1, alpha: 0.8), for: .highlighted)
        loginButton.setTitleColor(UIColor(white: 1, alpha: 0.8), for: .focused)
        loginButton.setTitleColor(UIColor(white: 1, alpha: 0.8), for: .selected)
        loginButton.setBackgroundImage(#imageLiteral(resourceName: "blue_pixel"), for: .normal)

        
        loginButton.layer.masksToBounds = true
        loginButton.layer.cornerRadius = radius
    
       loginButton.addTarget(self, action: #selector(doLogin), for: .touchUpInside)

        return loginButton
    }()
     
    override func viewDidLoad() {
        super.viewDidLoad()
   
        setupConstraints()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    NotificationCenter.default.addObserver(self,selector: #selector(keyboardWillShow),name: UIResponder.keyboardWillShowNotification,object: nil)
        
        NotificationCenter.default.addObserver(self,selector: #selector(keyboardWillHide),name: UIResponder.keyboardWillHideNotification,object: nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        emailTextField.becomeFirstResponder()
        passwordTextField.becomeFirstResponder()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
    NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
    NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    
    
    @objc private func doLogin(_ sender: Any) {
        let profileVC = ProfileViewController()
        navigationController?.pushViewController(profileVC, animated: true)
    }
    
    
    
    private func setupConstraints() {
        navigationController?.navigationBar.isHidden = true
  
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        contentView.addSubview(logoImageView)
        contentView.addSubview(inputFieldsStackView)
        contentView.addSubview(loginButton)

        

        let constraints = [
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            
            logoImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            logoImageView.topAnchor.constraint(equalTo:contentView.topAnchor,constant: 120.0),
            logoImageView.widthAnchor.constraint(equalToConstant: 100.0),
            logoImageView.heightAnchor.constraint(equalToConstant: 100.0),
            
            /*
            emailTextField.topAnchor.constraint(equalTo: logoImageView.bottomAnchor,constant: 120),
            emailTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -16),
            emailTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 16),
            emailTextField.heightAnchor.constraint(equalToConstant: textFieldHeight),
            
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor,constant: 0),
            passwordTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: -16),
            passwordTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 16),
            passwordTextField.heightAnchor.constraint(equalToConstant: textFieldHeight),
            */
            inputFieldsStackView.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: margin),
            inputFieldsStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: margin),
            inputFieldsStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -margin),
            emailTextField.heightAnchor.constraint(equalToConstant: textFieldHeight),
            passwordTextField.heightAnchor.constraint(equalToConstant: textFieldHeight),
            
            loginButton.topAnchor.constraint(equalTo: inputFieldsStackView.bottomAnchor, constant: margin),
            loginButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -margin),
            loginButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: margin),
            loginButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            loginButton.heightAnchor.constraint(equalToConstant: textFieldHeight)
        
            
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    

   
        
        @objc func keyboardWillShow(notification: NSNotification) {
            if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
                
                let insetAdjustment = keyboardSize.height - view.safeAreaInsets.bottom + margin
                scrollView.contentInset.bottom = insetAdjustment
                scrollView.verticalScrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: insetAdjustment, right: 0)
            }
        }
        
        @objc func keyboardWillHide(notification: NSNotification) {
            scrollView.contentInset.bottom = .zero
            scrollView.verticalScrollIndicatorInsets = .zero

        }
}
