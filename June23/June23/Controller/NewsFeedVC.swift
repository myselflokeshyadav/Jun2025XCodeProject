//
//  NewsFeedVC.swift
//  June23
//
//  Created by Lokesh Yadav on 24/06/25.
//

import UIKit

class NewsFeedVC: UIViewController,UITableViewDataSource {
    
    @IBOutlet weak var newsTbleView: UITableView!
    private var viewmodel: NewsViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewmodel =  NewsViewModel(networkService: NetworkManager.shared)
        bindViewModel()
        viewmodel.loadNews()
        // Do any additional setup after loading the view.
    }
    
    func bindViewModel()  {
        viewmodel.onUpdate = { [weak self] in
            DispatchQueue.main.async {
                self?.newsTbleView.reloadData()
            }
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewmodel.allArticles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell  =  tableView.dequeueReusableCell(withIdentifier: "NewsCell", for: indexPath) as? NewsCell else {
            return UITableViewCell()
        }
        let obj = viewmodel.allArticles[indexPath.row]
        cell.configureCell(article: obj)
        if  let urlStr = obj.urlToImage {
            viewmodel.loadImage(from: urlStr) { img in
                cell.setaImageNews(img: img)
            }
        }
        
        
        return cell
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
