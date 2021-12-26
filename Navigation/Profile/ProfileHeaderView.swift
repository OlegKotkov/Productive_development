

import UIKit

import SnapKit

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
        setupSNPConsraints()
      
    }
   
    fileprivate func setupSNPConsraints() {
    
        
        backgroundColor = .lightGray
        addSubview(avatarImageView)
        addSubview(titleLabel)
        addSubview(statusButton)
        addSubview(statusTextField)
        addSubview(statusLabel)
        
       
        avatarImageView.snp.makeConstraints { maker in
            maker.top.equalToSuperview().inset(16)
            maker.left.equalToSuperview().inset(16)
            maker.width.equalTo(110)
            maker.height.equalTo(110)
        }
        
    
        titleLabel.snp.makeConstraints { maker in
            maker.top.equalToSuperview().inset(27)
            maker.left.equalTo(avatarImageView.snp.right).inset(-16)
            
        }
       
        statusLabel.snp.makeConstraints{ maker in
            maker.top.equalToSuperview().inset(90)
            maker.left.equalTo(avatarImageView.snp.right).inset(-16)
           
        }
        statusTextField.snp.makeConstraints{ maker in
            maker.top.equalTo(statusLabel).inset(26)
            maker.left.equalTo(avatarImageView.snp.right).inset(-16)
            maker.width.equalTo(156)
            maker.right.equalToSuperview().inset(16)
            maker.height.equalTo(40)
        }

        statusButton.snp.makeConstraints {maker in
            maker.top.equalTo(avatarImageView.snp.bottom).inset(-40)
            maker.left.equalToSuperview().inset(16)
            maker.right.equalToSuperview().inset(16)
            maker.height.equalTo(50)
        }
        
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

    

