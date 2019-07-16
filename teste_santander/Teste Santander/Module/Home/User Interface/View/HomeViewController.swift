//
//  HomeViewController.swift
//  Teste Santander
//
//  Created by THIAGO on 02/07/19.
//  Copyright © 2019 Thiago Santos. All rights reserved.
//

import UIKit
import RNActivityView

class HomeViewController: UICollectionViewController {
    
    var presenter: HomePresenterInput?
    
    let headerID = "headerID"
    
    var sections = [Section]() {
        didSet {
           
            collectionView.reloadData()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        presenter?.viewDidLoad()
        setupCollectionView()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func setupCollectionView(){
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .white
        if #available(iOS 11.0, *) {
            collectionView?.contentInsetAdjustmentBehavior = .never
        }
    }
    
    fileprivate func registerCell(_ section: Section, collectionView: UICollectionView, at indexPath: IndexPath) {
        let cellClass = section.cell(for: indexPath)
        collectionView.register(cellClass, forCellWithReuseIdentifier: cellClass.identifier)
        let nibName = UINib(nibName: cellClass.identifier, bundle: nil)
        collectionView.register(nibName, forCellWithReuseIdentifier: cellClass.identifier)
    }
}
extension HomeViewController: UICollectionViewDelegateFlowLayout {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sections.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let section = sections[indexPath.row]
        let identifier = section.cell(for: indexPath).identifier
        
        registerCell(section, collectionView: collectionView, at: indexPath)
        
        return collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath)
    }
    
    override func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let section = sections[indexPath.row]
        if let cell = cell as? CollectionViewCell {
            cell.delegate = self
            section.willDisplayCell(cell, at: indexPath)
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let section = sections[indexPath.row]
        
        var sizeCell: CGSize = CGSize(width: 1, height: 1)
        
        registerCell(section, collectionView: collectionView, at: indexPath)
        
        let cellType = section.cell(for: indexPath)
        
        sizeCell = section.getCellSize(cellType, for: indexPath)
        
        if sizeCell == .zero, let cell = section.cell(for: indexPath).fromNib() {
            cell.prepareForReuse()
            section.willDisplayCell(cell, at: indexPath)
            cell.setNeedsLayout()
            cell.layoutIfNeeded()
            sizeCell = cell.contentView.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
            section.setCell(cellType, size: sizeCell, for: indexPath)
        }
        return sizeCell
    }
}

extension HomeViewController: HomePresenterOutput, CollectionViewCellDelegate {
    
    func showAlert(with message: String) {
        let alert = UIAlertController(title: "Opss Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancelar", style: .default, handler: { (_) in
            
        }))
        alert.addAction(UIAlertAction(title: "Tentar novamente", style: .default, handler: { (_) in
            self.presenter?.retry()
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func startLoading() {
        self.view.showActivityView()
    }
    
    func stopLoading() {
        self.view.hideActivityView()
    }
    
    func didTap() {
        presenter?.shoudLogout()
    }
    
    func fetched(sections: [Section]) {
        self.sections = sections
    }
    
}
