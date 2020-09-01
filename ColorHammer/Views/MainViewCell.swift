//
//  MainViewCell.swift
//  ColorHammer
//
//  Created by lzjlxebr on 2020/8/29.
//

import UIKit

class MainViewCell: UICollectionViewCell {
    
    // MARK: - Variables
    
    var model:MenuItem = .init(name: "", icon: "")
    
    // MARK: - Event Closure
    
    var onTapped = { (model: MenuItem) in}
    
    var onLongPressed = { (model: MenuItem) in}
    
    // MARK: - Subview Variables
    
    /**
     The icon
     */
    lazy var iconView: UIImageView = {
        let v = UIImageView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        return v
    }()
    
    /**
     The label of description
     */
    lazy var labelView: UILabel = {
        let v = UILabel(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        v.font = UIFont(name: Constants.userFontName, size: 20)
        v.numberOfLines = 0
        v.lineBreakMode = .byWordWrapping
        return v
    }()
    
    // MARK: - Initial Methods
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setupEvent()
        self.setupView()
        self.setupStyle()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    /**
     Setup View Style
     */
    private func setupStyle() {
        self.contentView.layer.borderWidth = 1
        self.contentView.layer.borderColor = UIColor.white.cgColor
        self.contentView.backgroundColor = UIColor.orange
        
        self.contentView.layer.cornerRadius = 16
        self.contentView.clipsToBounds = true
    }
    
    /**
     Setup View's Hierarchy
     */
    private func setupView() {
        self.contentView.addSubview(iconView)
        self.contentView.addSubview(labelView)
        
        self.iconView.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(8)
        }
        
        self.labelView.snp.makeConstraints { (make) in
            make.width.lessThanOrEqualTo(144)
            make.centerX.equalToSuperview()
            make.top.equalTo(self.iconView.snp.bottom).offset(8)
        }
    }
    
    /**
     Setup View's Event
     */
    private func setupEvent() {
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tappedAction)))
    }
    
    @objc private func tappedAction() {
        self.onTapped(model)
    }
}
