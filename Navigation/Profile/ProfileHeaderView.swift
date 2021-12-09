

import UIKit

class ProfileHeaderView: UIView {
    
     let margin: CGFloat = 16.0
     let largeMargin: CGFloat = 27.0
     let radius: CGFloat = 4.0
     let avatarSize: CGFloat = 110.0
     let textFieldHeight: CGFloat = 40.0
     let defaultStatusText = "Waiting for something..."

    private lazy var avatarImageView: UIImageView = {
        let imageView = UIImageView(image:UIImage(named: "profilePicture"))
        imageView.layer.cornerRadius = avatarSize / 2.0
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.layer.borderWidth = 3
        imageView.clipsToBounds = true
        return imageView
    }()
    
    
    
     private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Oleg Kotkov"
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textColor = .black
        label.sizeToFit()
        return label
        

    }()
    
     private lazy var statusLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .gray
        label.text = defaultStatusText
        label.sizeToFit()
        return label
    }()
    
    private lazy var statusButton: UIButton = {
        let button = UIButton()

        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Set status", for: .normal)
        button.clipsToBounds = true
        button.layer.masksToBounds = false
        button.layer.cornerRadius = radius
        button.layer.shadowOffset = CGSize(width: radius, height: radius)
        button.layer.shadowRadius = radius
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.7
        button.addTarget(self, action: #selector(statusButtonTapped), for: .touchUpInside)
        return button
    }()
    
     private lazy var statusTextField: UITextField = {
        let textField = UITextField()
        textField .textColor = .black
        textField .font = UIFont.systemFont(ofSize: 15)
        textField.layer.masksToBounds = true
        textField.layer.addSublayer(statusTextFieldBackgroundLayer)
        textField.addTarget(self, action: #selector(statusTextFieldChanged), for: .editingChanged)
        return textField
    }()
    
     private lazy var statusTextFieldBackgroundLayer: CALayer = {
        let borderLayer = CALayer()
        borderLayer.borderColor = UIColor.black.cgColor
        borderLayer.borderWidth = 1.0
        borderLayer.cornerRadius = 12.0
        borderLayer.backgroundColor = UIColor.white.cgColor
        return borderLayer
    }()
    
     private lazy var statusText: String = defaultStatusText
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        statusButton.translatesAutoresizingMaskIntoConstraints = false
        statusTextField.translatesAutoresizingMaskIntoConstraints = false
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        setupConstraints()
    }
    
    
    
    fileprivate func setupConstraints() {
    
        
        backgroundColor = .lightGray
        addSubview(avatarImageView)
        addSubview(titleLabel)
        addSubview(statusButton)
        addSubview(statusTextField)
        addSubview(statusLabel)
        
        
        let constraints = [
            
            avatarImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            avatarImageView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            avatarImageView.widthAnchor.constraint(equalToConstant: 110), avatarImageView.heightAnchor.constraint(equalToConstant: 110),
            

            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 27),
            titleLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: 16),
            
            statusButton.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 43),
            statusButton.topAnchor.constraint(equalTo: statusTextField.bottomAnchor, constant: 16),
            statusButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            statusButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            statusButton.heightAnchor.constraint(equalToConstant: 50),
        
            
            
            statusTextField.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 6),
            statusTextField.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 16),
            statusTextField.widthAnchor.constraint(equalToConstant: 256),
            statusTextField.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            statusTextField.bottomAnchor.constraint(equalTo: statusButton.topAnchor, constant: -16),
            statusTextField.heightAnchor.constraint(equalToConstant: 40),

            statusLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 16),
            statusLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),

        ]
        NSLayoutConstraint.activate(constraints)
        //self.view.setNeedsLayout()
        //self.view.layoutIfNeeded()
        
        
        
        
        
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        statusTextFieldBackgroundLayer.frame = CGRect(
            x: 0,
            y: 0,
            width: statusTextField.bounds.width,
            height: statusTextField.bounds.height
        )
    }

    

    @objc private func statusButtonTapped() {
        statusLabel.text = statusText
        statusTextField.text = ""
    }

    @objc private func statusTextFieldChanged(_ textField: UITextField) {
        guard let statusText = textField.text else {
            print("No status has been entered!")
            return
        }
        self.statusText = statusText
    }

    
    
    
    
}

    

