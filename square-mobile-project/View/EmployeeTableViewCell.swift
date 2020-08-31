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
    
    func bind(employeeViewModel: EmployeeViewModelInterface, for index: Int) {
        employeeNameLabel.text = employeeViewModel.employeeName(at: index)
        employeeTeamLabel.text = employeeViewModel.employeeTeam(at: index)
        employeeEmailLabel.text = employeeViewModel.employeeEmail(at: index)
        employeePhoneLabel.text = employeeViewModel.employeePhone(at: index)
        
        employeeAvatarImageView.kf.indicatorType = .activity
        let processor = RoundCornerImageProcessor(cornerRadius: .thumbnailWidth)
        employeeAvatarImageView.kf.setImage(with: employeeViewModel.employeePicture(at: index), placeholder: UIImage(named: Constants.Images.placeholder), options: [.transition(.fade(0.2)), .processor(processor)])
    }
}
