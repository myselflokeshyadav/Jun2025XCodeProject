//
//  ViewController.swift
//  June23
//
//  Created by Lokesh Yadav on 23/06/25.
//

import UIKit

class NameVC: UIViewController {
    var arrName: [User] = []
    

    @IBOutlet weak var nameTblView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupData()
    }
    
    func setupData() {
        DispatchQueue.global(qos: .background).async  { [weak self] in
            self?.arrName = ViewModelName().loadDataArray()
            DispatchQueue.main.async {
                self?.nameTblView.reloadData()
            }
        }
    }


}
extension NameVC: UITableViewDataSource,UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrName.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CountryCell", for: indexPath) as? CountryCell else { return UITableViewCell() }
        let obj = arrName[indexPath.row]
        cell.configureCell(user: obj)
        return cell
    }
}

