//
//  SingleTableViewCell.swift
//  Neobis_iOS_UIScreenss
//
//  Created by Interlink on 15/11/23.
//
import UIKit
class SingleTableViewCell: UITableViewCell {
    static let identifier = "SingleTableViewCell"

    private let singleImage: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.tintColor = .label
        return iv
    }()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 25, weight: .medium)
        return label
    }()

    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 15, weight: .regular)
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpUi()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setUpUi() {
        contentView.addSubview(singleImage)
        contentView.addSubview(titleLabel)
        contentView.addSubview(descriptionLabel)

        singleImage.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            singleImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            singleImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            singleImage.heightAnchor.constraint(equalToConstant: 70),
            singleImage.widthAnchor.constraint(equalToConstant: 70),
            
            titleLabel.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: singleImage.leadingAnchor, constant: -8),
            
            descriptionLabel.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor),
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            descriptionLabel.trailingAnchor.constraint(equalTo: singleImage.leadingAnchor, constant: -8)
        ])
    }

    func configure(with image: UIImage, title: String, description: String) {
        self.singleImage.image = image
        self.titleLabel.text = title
        self.descriptionLabel.text = description
    }
}

