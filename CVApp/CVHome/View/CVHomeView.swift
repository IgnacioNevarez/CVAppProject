//
//  CVHomeView.swift
//  CVApp
//
//  Created by Ignacio Esau Nevarez on 06/12/19.
//  Copyright © 2019 Ignacio Esau Nevarez. All rights reserved.
//

import UIKit

class CVHomeView: UIViewController {
    
    @IBOutlet weak var cvHomeCollectionView: UICollectionView!
    
    var presenter: CVHomePresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareView()
    }
    
    private func prepareView(){
        cvHomeCollectionView.delegate = self
        cvHomeCollectionView.dataSource = self
        self.navigationController?.navigationBar.topItem?.title = presenter?.getCandidateName()?.uppercased()
        self.navigationController?.navigationBar.backgroundColor = .gray
    }
}

extension CVHomeView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        guard let presenter = presenter else { return 0 }
        return presenter.getItemsInSection()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CVHomeCell.identifier, for: indexPath) as! CVHomeCell
        
        guard let valuesForItem = presenter?.getValuesForItem(indexPath: indexPath) else { return UICollectionViewCell() }
        cell.prepareCell(homeSections: valuesForItem, width: collectionView.frame.width)
        return cell
    }
    
}

extension CVHomeView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let presenter = presenter else { return }
        presenter.didSelectItemAt(indexPath: indexPath, originController: self)
    }
}

extension CVHomeView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return  presenter?.getSizeForItem(width: collectionView.frame.width) ?? .init(width: 0, height: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let space = CVConstants.SizeForCell.space
        return UIEdgeInsets(top: space, left: space, bottom: space, right: space)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return CVConstants.SizeForCell.space
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

extension CVHomeView: CVHomeViewProtocol {
    
}
