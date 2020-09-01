//
//  FontSelectorController.swift
//  ColorHammer
//
//  Created by lzjlxebr on 2020/8/30.
//

import UIKit

class FontSelectorController: BaseViewController {
    
    // MARK: - Views
    
    lazy var fontSelector: FontSelector = {
        let v = FontSelector()
        return v
    }()
    
    // MARK: - Life Cycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupView()
        self.setupStyle()
        self.setupViewHierachy()
        self.handleSettingsViewCellTapped()
    }
    
    // MARK: - Custom Methods
    
    private func setupView() {
        self.view.addSubview(self.fontSelector)
    }
    
    private func setupViewHierachy() {
        self.fontSelector.snp.makeConstraints { (make) in
            make.bottom.left.right.top.equalToSuperview()
        }
    }
    
    private func setupStyle() {
        guard let navController = self.navigationController else { return }
        navController.navigationBar.isTranslucent = true
        
        let leftButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(leftButtonAction))
        
        navController.navigationBar.topItem?.setLeftBarButton(leftButtonItem, animated: true)
    }
    
    // MARK: - Event Handle Methods
    
    @objc private func rightButtonAction() {
        self.dismiss(animated: true, completion: {})
    }
    
    @objc private func leftButtonAction() {
        self.dismiss(animated: true, completion: {})
    }
    
    private func handleSettingsViewCellTapped() {
        self.fontSelector.onCellTapped = { model in
            LocalStorage.setValue(for: .PreferredFontNameKey, value: model.name)
//            self.navigationController?.pushViewController(FontSelectorController(), animated: true)
//            self.present(UINavigationController(rootViewController: FontSelectorController()), animated: true, completion: {})
        }
    }
}
