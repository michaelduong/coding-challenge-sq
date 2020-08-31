//
//  EmployeeTableViewCell.swift
//  square-mobile-project
//
//  Created by Michael Duong on 8/13/20.
//

import UIKit
import Kingfisher
import Stevia

final class EmployeeTableViewCell: UITableViewCell {
    
    // MARK: - Properties & Outlets
    let employeeNameLabel = UILabel(font: .name, textColor: .label, textAlignment: .right)
    let employeeTeamLabel = UILabel(font: .team, textColor: .label, textAlignment: .right)
    let employeeEmailLabel = UILabel(font: .info, textColor: .label, textAlignment: .right)
    let employeePhoneLabel = UILabel(font: .info, textColor: .label, textAlignment: .right)
    let employeeAvatarImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    private var stackView = UIStackView()
    
    var employeeViewModel: EmployeeViewModel! {
        didSet {
            bind()
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        stackView = UIStackView(arrangedSubviews: [
            employeeNameLabel,
            employeeTeamLabel,
            employeeEmailLabel,
            employeePhoneLabel
        ])
        stackView.axis = .vertical
        stackView.spacing = 2
        stackView.distribution = .fillEqually
        stackView.alignment = .trailing
        
        contentView.subviews(
            stackView,
            employeeAvatarImageView
        )
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        employeeAvatarImageView
            .width(.thumbnailWidth)
            .height(.thumbnailHeight)
            .centerVertically()
            .leading(.horizontalMargin)
        
        stackView
            .centerVertically()
            .trailing(.horizontalMargin)
    }
    
    private func bind() {
        employeeNameLabel.text = employeeViewModel.name
        employeeTeamLabel.text = employeeViewModel.team
        employeeEmailLabel.text = employeeViewModel.email
        employeePhoneLabel.text = employeeViewModel.phone
        
        employeeAvatarImageView.kf.indicatorType = .activity
        let processor = RoundCornerImageProcessor(cornerRadius: .thumbnailWidth)
        employeeAvatarImageView.kf.setImage(with: employeeViewModel.imageUrl, placeholder: UIImage(named: Constants.Images.placeholder), options: [.transition(.fade(0.2)), .processor(processor)])
    }
}
