//
//  CVWorkExperienceView.swift
//  CVApp
//
//  Created by Ignacio Esau Nevarez on 06/12/19.
//  Copyright © 2019 Ignacio Esau Nevarez. All rights reserved.
//

import UIKit

class CVWorkExperienceView: UIViewController {
    
    var presenter: CVWorkExperiencePresenterProtocol?
    
    @IBOutlet weak var cvWorkExperienceTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareView()
    }
    
    private func prepareView(){
        cvWorkExperienceTableView.dataSource = self
        cvWorkExperienceTableView.delegate = self
        cvWorkExperienceTableView.register(UINib(nibName: "CVWorkExperienceCell", bundle: nil), forCellReuseIdentifier: CVWorkExperienceCell.identifier)
        self.navigationController?.navigationBar.backgroundColor = .gray
    }
    
}

extension CVWorkExperienceView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let presenter = presenter else { return 0 }
        return presenter.getSizeForItem(indexPath: indexPath)
    }
}

extension CVWorkExperienceView: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        guard let presenter = presenter else { return 0 }
        return presenter.getSections()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let presenter = presenter else { return 0 }
        return presenter.getItemsInSection(section: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let presenter = presenter else { return UITableViewCell() }
        let reuseIdentifier = presenter.getCellIdentifier(indexPath: indexPath)
        
            let cvWorkExperienceCell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! CVWorkExperienceCell
            let workExperience = presenter.getValuesForWorkExperience(indexPath: indexPath)
            cvWorkExperienceCell.prepareCell(workExperience: workExperience)
            return cvWorkExperienceCell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return presenter?.getSectionTitle(section: section)
    }
    
}

extension CVWorkExperienceView: CVWorkExperienceViewProtocol {
    
}
