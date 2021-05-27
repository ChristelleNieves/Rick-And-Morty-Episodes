//
//  VideoCell.swift
//  nostoryboard
//
//  Created by Christelle Nieves on 5/26/21.
//

import UIKit

class ListCell: UITableViewCell {
    
    var EpisodeTitleLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        // Add the subviews
        contentView.addSubview(EpisodeTitleLabel)
        
        // Configure the subviews
        configureTitleLabel()
        
        // Set the constraints
        setTitleLabelConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureTitleLabel() {
        EpisodeTitleLabel.numberOfLines = 0
        EpisodeTitleLabel.adjustsFontSizeToFitWidth = true
    }
    
    func setTitleLabelConstraints() {
        EpisodeTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        EpisodeTitleLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        EpisodeTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        EpisodeTitleLabel.heightAnchor.constraint(equalToConstant: 80).isActive = true
        EpisodeTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
    }
    
}
