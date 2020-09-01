//
//  MainView.swift
//  ColorHammer
//
//  Created by lzjlxebr on 2020/8/29.
//

import UIKit

class MainView: UIView {
    // MARK: - Static Variables
    
    /**
     The UICollectionView's width
     */
    static let width:CGFloat = 300
    
    /**
     The UICollectionView's height
     */
    static let height:CGFloat = 500
    
    /**
     The UICollectionViewCell's width
     */
    static let cellWidth:CGFloat = 160
    
    /**
     The UICollectionViewCell's height
     */
    static let cellHeight:CGFloat = 160
    
    /**
     The identifier of UICollectionViewCell
     */
    static let id:String = "MainView"
    
    
    // MARK: - Variables
    
    /**
     The datasource of UICollectionView
     */
    var list:[MenuItem] =
        [
            .init(name: "Date & Time Conversion", icon: "", r: 0.16, g: 0.66, b: 0.66),
            .init(name: "Message Digest", icon: "", r: 0.26, g: 0.66, b: 0.66),
            .init(name: "Data Encryption", icon: "", r: 0.36, g: 0.66, b: 0.66),
            .init(name: "CRON", icon: "", r: 0.46, g: 0.66, b: 0.66),
            .init(name: "Network", icon: "", r: 0.56, g: 0.66, b: 0.66),
            .init(name: "Encoding & Decoding", icon: "", r: 0.76, g: 0.66, b: 0.66),
            .init(name: "Texture Factory", icon: "", r: 0.86, g: 0.66, b: 0.66),
            .init(name: "Emergency Record", icon: "", r: 0.96, g: 0.66, b: 0.66),
        ]
    
    // MARK: - Event Closure
    
    var onCellTapped = { (model: MenuItem) in}
    
    
    // MARK: - Subview Variables
    
    /**
     The main collection view
     */
    lazy var collectionView: UICollectionView = {
        let layout = DSSCollectionViewFlowLayout()
        layout.placeEqualSpaceForAllCells = true
        layout.scrollDirection = UICollectionView.ScrollDirection.vertical
        
        layout.minimumInteritemSpacing = 8
        layout.minimumLineSpacing = 8
        layout.itemSize = CGSize(width: MainView.cellWidth, height: MainView.cellHeight)
        
        let v = UICollectionView(frame: CGRect(x: 0, y: 0, width: MainView.width, height: MainView.height), collectionViewLayout: layout)
        v.register(MainViewCell.self, forCellWithReuseIdentifier: MainView.id)
        v.isScrollEnabled = true
        v.showsHorizontalScrollIndicator = false
        v.showsVerticalScrollIndicator = false
        v.delegate = self
        v.dataSource = self
        v.backgroundColor = .clear
        v.contentMode = .center
        
        // contentInsetAdjustmentBehavior is use to handle with safearea
        v.contentInsetAdjustmentBehavior = .scrollableAxes
        v.contentInset = .init(top: 16, left: 16, bottom: 16, right: 16)
        
        return v
    }()
    
    
    // MARK: - Initial Methods
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(self.collectionView)
        
        self.collectionView.snp.makeConstraints { (make) in
            make.bottom.equalToSuperview()
            make.top.equalToSuperview()
            make.right.equalToSuperview()
            make.left.equalToSuperview()
        }
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

// MARK: - MainView Extension

/**
 UICollectionView Delegates
 */
extension MainView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout  {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        list.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainView.id, for: indexPath) as! MainViewCell
        let model = self.list[indexPath.row]
        cell.labelView.text = model.name
        cell.contentView.backgroundColor = UIColor(red: model.r, green: model.g, blue: model.b, alpha: model.a)
        cell.model = self.list[indexPath.row]
        
        cell.onTapped = { model in
            self.onCellTapped(model)
        }
        
        cell.onLongPressed = { model in
            self.onCellTapped(model)
        }
        return cell
    }
    
    @available(iOS 13.0, *)
    func collectionView(_ collectionView: UICollectionView, contextMenuConfigurationForItemAt indexPath: IndexPath, point: CGPoint) -> UIContextMenuConfiguration? {

        return UIContextMenuConfiguration(identifier: nil, previewProvider: nil, actionProvider: { suggestedActions in

            // "puppers" is the array backing the collection view
            return self.makeContextMenu(for: self.list[indexPath.row])
        })
    }
    
    @available(iOS 13.0, *)
    func makeContextMenu(for: MenuItem) -> UIMenu {

        let rename = UIAction(title: "Rename Pupper", image: UIImage(systemName: "square.and.pencil")) { action in
            // Show rename UI
        }

        // Here we specify the "destructive" attribute to show that it’s destructive in nature
        let delete = UIAction(title: "Delete Photo", image: UIImage(systemName: "trash"), attributes: .destructive) { action in
            // Delete this photo 😢
        }

        // The "title" will show up as an action for opening this menu
        let edit = UIMenu(title: "Edit...", children: [rename, delete])


        // Create our menu with both the edit menu and the share action
        return UIMenu(title: "Main Menu", children: [edit, delete])
    }
    
    
}
