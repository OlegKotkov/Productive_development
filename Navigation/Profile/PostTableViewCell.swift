//
//  PostTableViewCell.swift
//  Navigation
//
//  Created by mac on 12.11.2021.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    
    let margin: CGFloat = 16.0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
    static let reuseIdentifier = "PostTableViewCell"
    
    private let authorLabel: UILabel = {
        let authorLabel = UILabel()
        authorLabel.translatesAutoresizingMaskIntoConstraints = false
        authorLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        authorLabel.textColor = .black
        authorLabel.numberOfLines = 2

        return authorLabel
    }()
    private let postImageView: UIImageView = {
        let imageView = UIImageView()

        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .black

        return imageView
    }()
    private let descriptionLabel: UILabel = {
        let descriptionLabel = UILabel()

        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.font = .systemFont(ofSize: 14)
        descriptionLabel.textColor = .systemGray
        descriptionLabel.numberOfLines = 0

        return descriptionLabel
    }()
    private let likesLabel: UILabel = {
        let likesLabel = UILabel()

        likesLabel.setupLabels()

        return likesLabel
    }()
    private let viewsLabel: UILabel = {
        let viewsLabel = UILabel()

        viewsLabel.setupLabels()

        return viewsLabel
    }()

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
    }
    
    
    
     func setupUI() {
      //  selectionStyle = .plain()
        contentView.addSubview(authorLabel)
        contentView.addSubview(postImageView)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(likesLabel)
        contentView.addSubview(viewsLabel)
        
        let constraints = [
            authorLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: margin),
            authorLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: margin),
            authorLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -margin),
            postImageView.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: 12.0),
            postImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            postImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            postImageView.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            postImageView.heightAnchor.constraint(equalTo: postImageView.widthAnchor),
            descriptionLabel.leadingAnchor.constraint(equalTo: authorLabel.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: authorLabel.trailingAnchor),
            descriptionLabel.topAnchor.constraint(equalTo: postImageView.bottomAnchor, constant: margin),
            likesLabel.leadingAnchor.constraint(equalTo: descriptionLabel.leadingAnchor) ,
            likesLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: margin),
            likesLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -margin),
            viewsLabel.trailingAnchor.constraint(equalTo: descriptionLabel.trailingAnchor),
            viewsLabel.topAnchor.constraint(equalTo: likesLabel.topAnchor),
            viewsLabel.bottomAnchor.constraint(equalTo: likesLabel.bottomAnchor)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    func configure(with post: Post) {
        authorLabel.text = post.author
        postImageView.image = UIImage(named: post.image)
        descriptionLabel.text = post.description
        likesLabel.text = "Likes: \(post.likes)"
        viewsLabel.text = "Views: \(post.views)"
    }
    
}

extension UILabel {
    func setupLabels() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.font = .systemFont(ofSize: 16)
        self.textColor = .black
    }
    
    
    
    
    
    
}
