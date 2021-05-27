//
//  DetailViewController.swift
//  nostoryboard
//
//  Created by Christelle Nieves on 5/27/21.
//

import UIKit

class DetailViewController: UIViewController {
    var details: Episode?
    let titleLabel = UILabel()
    let airdateLabel = UILabel()
    let episodeNumberLabel = UILabel()
    let episodeLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Detail view
        configureDetailView()
        
        // Title label
        configureTitleLabel()
        setTitleLabelConstraints()
        
        // Episode label
        configureEpisodeLabel()
        setEpisodeLabelConstraints()
        
        // Episode number label
        configureEpisodeNumberLabel()
        setEpisodeNumberLabelConstraints()
        
        // Airdate label
        configureAirdateLabel()
        setAirdateLabelConstraints()
    }
    
    func configureDetailView() {
        title = "Episode Details"
        self.view.backgroundColor = .black
    }
    
    func configureTitleLabel() {
        titleLabel.text = details!.name
        titleLabel.textColor = .systemBlue
        titleLabel.font = UIFont.boldSystemFont(ofSize: 40.0)
        titleLabel.adjustsFontSizeToFitWidth = true
        titleLabel.numberOfLines = 0
        titleLabel.lineBreakMode = .byTruncatingTail
        titleLabel.minimumScaleFactor = 0.8
        self.view.addSubview(titleLabel)
    }
    
    func setTitleLabelConstraints() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
    }
    
    func configureAirdateLabel() {
        airdateLabel.text = "Air Date: " + details!.air_date
        airdateLabel.textColor = .white
        airdateLabel.font = UIFont.boldSystemFont(ofSize: 20.0)
        airdateLabel.adjustsFontSizeToFitWidth = true
        airdateLabel.numberOfLines = 0
        airdateLabel.lineBreakMode = .byTruncatingTail
        airdateLabel.minimumScaleFactor = 0.8
        self.view.addSubview(airdateLabel)
    }
    
    func setAirdateLabelConstraints() {
        airdateLabel.translatesAutoresizingMaskIntoConstraints = false
        airdateLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        airdateLabel.topAnchor.constraint(equalTo: episodeNumberLabel.bottomAnchor, constant: 35).isActive = true
        airdateLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 20).isActive = true
    }
    
    func configureEpisodeNumberLabel() {
        episodeNumberLabel.text = "Episode Number: " + String(details!.id)
        episodeNumberLabel.textColor = .white
        episodeNumberLabel.font = UIFont.boldSystemFont(ofSize: 20.0)
        episodeNumberLabel.adjustsFontSizeToFitWidth = true
        episodeNumberLabel.numberOfLines = 0
        episodeNumberLabel.lineBreakMode = .byTruncatingTail
        episodeNumberLabel.minimumScaleFactor = 0.8
        self.view.addSubview(episodeNumberLabel)
    }
    
    func setEpisodeNumberLabelConstraints() {
        episodeNumberLabel.translatesAutoresizingMaskIntoConstraints = false
        episodeNumberLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        episodeNumberLabel.topAnchor.constraint(equalTo: episodeLabel.bottomAnchor, constant: 35).isActive = true
        episodeNumberLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 20).isActive = true
    }
    
    func configureEpisodeLabel() {
        episodeLabel.text = details!.episode
        episodeLabel.textColor = .white
        episodeLabel.font = UIFont.boldSystemFont(ofSize: 25.0)
        episodeLabel.adjustsFontSizeToFitWidth = true
        episodeLabel.numberOfLines = 0
        episodeLabel.lineBreakMode = .byTruncatingTail
        episodeLabel.minimumScaleFactor = 0.8
        self.view.addSubview(episodeLabel)
    }
    
    func setEpisodeLabelConstraints() {
        episodeLabel.translatesAutoresizingMaskIntoConstraints = false
        episodeLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        episodeLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 35).isActive = true
        episodeLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 20).isActive = true
    }

}
