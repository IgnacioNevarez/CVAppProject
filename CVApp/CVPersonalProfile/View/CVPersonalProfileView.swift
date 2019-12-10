//
//  CVPersonalProfileView.swift
//  CVApp
//
//  Created by Ignacio Esau Nevarez on 06/12/19.
//  Copyright © 2019 Ignacio Esau Nevarez. All rights reserved.
//

import UIKit

class CVPersonalProfileView: UIViewController {
    
    @IBOutlet weak var cvPersonalProfileTableView: UITableView!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    
    var presenter: CVPersonalProfilePresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareView()
        setImage()
    }
    
    private func prepareView(){
        cvPersonalProfileTableView.dataSource = self
        cvPersonalProfileTableView.delegate = self
        cvPersonalProfileTableView.register(UINib(nibName: "CVAboutCell", bundle: nil), forCellReuseIdentifier: CVAboutCell.identifier)
        cvPersonalProfileTableView.register(UINib(nibName: "CVContactInfoCell", bundle: nil), forCellReuseIdentifier: CVContactInfoCell.identifier)
        self.navigationController?.navigationBar.backgroundColor = .gray
        
    }
    
    private func setImage() {
        guard let url = presenter?.getCandidatePhoto() else {
            return
        }
        photoImageView.loadImageFromURL(urlImage: url) {
            self.loadingIndicator.stopAnimating()
        }
    }

}

extension CVPersonalProfileView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let presenter = presenter else { return 0 }
        return presenter.getSizeForItem(indexPath: indexPath)
    }
}

extension CVPersonalProfileView: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        guard let presenter = presenter else { return 0 }
        return presenter.getSections()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let presenter = presenter else { return 0 }
        return presenter.getItemsInSection(section: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let index = indexPath.section
        
        guard let presenter = presenter else { return UITableViewCell() }
        let reuseIdentifier = presenter.getCellIdentifier(indexPath: indexPath)
        
        if index == 0 {
            let cvAboutCell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! CVAboutCell
            let about = presenter.getAboutValue(indexPath: indexPath)
            cvAboutCell.prepareCell(about: about)
            return cvAboutCell
        } else {
            let cvContactInfoCell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! CVContactInfoCell
            let contactInfo = presenter.getValuesForContactItem(indexPath: indexPath)
            cvContactInfoCell.prepareCell(contactInfo: contactInfo)
            return cvContactInfoCell
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return presenter?.getSectionTitle(section: section)
    }
    
}

extension CVPersonalProfileView: CVPersonalProfileViewProtocol {
    
}
