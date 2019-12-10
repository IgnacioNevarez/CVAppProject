//
//  CVEducationView.swift
//  CVApp
//
//  Created by Ignacio Esau Nevarez on 06/12/19.
//  Copyright © 2019 Ignacio Esau Nevarez. All rights reserved.
//

import UIKit

class CVEducationView: UIViewController {
    
    @IBOutlet weak var cvEducationTableView: UITableView!
    var presenter: CVEducationPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareView()
    }
    
    private func prepareView(){
        cvEducationTableView.dataSource = self
        cvEducationTableView.delegate = self
        cvEducationTableView.register(UINib(nibName: "CVEducationCell", bundle: nil), forCellReuseIdentifier: CVEducationCell.identifier)
        cvEducationTableView.register(UINib(nibName: "CVTechnicalSkillsCell", bundle: nil), forCellReuseIdentifier: CVTechnicalSkillsCell.identifier)
        self.navigationController?.navigationBar.backgroundColor = .gray
        
    }

}

extension CVEducationView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let presenter = presenter else { return 0 }
        return presenter.getSizeForItem(indexPath: indexPath)
    }
}

extension CVEducationView: UITableViewDataSource {
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
            let cvEducationCell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! CVEducationCell
            let education = presenter.getValuesForEducation(indexPath: indexPath)
            cvEducationCell.prepareCell(education: education)
            return cvEducationCell
        } else {
            let cvTechnicalSkillsCell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! CVTechnicalSkillsCell
            let technicalSkills = presenter.getValuesForTechnicalSkills(indexPath: indexPath)
            cvTechnicalSkillsCell.prepareCell(technicalSkills: technicalSkills)
            return cvTechnicalSkillsCell
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return presenter?.getSectionTitle(section: section)
    }
    
}

extension CVEducationView: CVEducationViewProtocol {
    
}
