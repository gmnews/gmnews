//
//  NewsTableViewController.swift
//  gmNews
//
//  Created by Gilbert Curbelo on 4/6/19.
//  Copyright © 2019 Martin Landin. All rights reserved.
//

import UIKit
import NewsAPISwift
import Parse
import SafariServices

class NewsTableViewController: UITableViewController, SFSafariViewControllerDelegate {
    
    let newsAPI = NewsAPI(apiKey: "9442852d248a42ae99a51dfe4189c0e5")
    var myString: String? = nil
    var articles = [NewsArticle]() {
        didSet {
            DispatchQueue.main.async {
                if self.articles.count == 0 {
                    self.setEmptyView(title: "Error", message: "Error loading sources")
                }
                self.tableView.reloadData()
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(onRefresh), for: .valueChanged)
        self.refreshControl = refreshControl
        
        navigationController?.navigationBar.barStyle = .black
        
        loadNews()
    }
    
    func loadNews(){
        let country = PFUser.current()?.object(forKey: "country") as? String
        let abr = country?.prefix(2).lowercased()
        //print(String(abr!))
        
        newsAPI.getTopHeadlines(country: NewsCountry(rawValue: String(abr!)) ?? .us) { result in
            switch result {
            case .success(let headlines):
                self.articles = headlines
                //self.articles = []
            case .failure(let error):
                self.articles = []
                print(error)
            }
        }
    }
    
    @objc func onRefresh(){
        tableView.reloadData()
        refreshControl?.endRefreshing()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "newsSource", for: indexPath) as! ArticleTableViewCell
        
        let urlString =  articles[indexPath.row].url.absoluteString
        cell.url = urlString
        cell.sourceName.text = articles[indexPath.row].source.name
        myString = articles[indexPath.row].articleDescription
        if(myString ?? "").isEmpty{
                cell.articleText.text = articles[indexPath.row].title
        }else {
            cell.articleText.text = articles[indexPath.row].articleDescription
        }
        
        return cell
    }
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if articles.count == 0 {
            self.setEmptyView(title: "Error", message: "Error loading sources")
        } else {
            self.restore()
        }
        return articles.count
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    /*override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        let cell = sender as! UITableViewCell
        let indexPath = tableView.indexPath(for: cell)!
        let article = articles[indexPath.row]
        print(article.url.absoluteString)
        /*guard let url = URL(string: article.url.absoluteString) else {
            return
        }
        
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(url)
        }*/
        let svc = SFSafariViewController(url: article.url)
        //print(article.url)
        self.present(svc, animated: true, completion: nil)
        svc.delegate = self
    }*/
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let article = articles[indexPath.row]
        let svc = SFSafariViewController(url: article.url)
        //print(article.url)
        self.present(svc, animated: true, completion: nil)
        svc.delegate = self
    }
    
    func setEmptyView(title: String, message: String) {
        let emptyView = UIView(frame: CGRect(x: tableView.center.x, y: tableView.center.y, width: tableView.bounds.size.width, height: tableView.bounds.size.height))
        let titleLabel = UILabel()
        let messageLabel = UILabel()
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.textColor = UIColor.black
        titleLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 18)
        
        messageLabel.textColor = UIColor.lightGray
        messageLabel.font = UIFont(name: "HelveticaNeue-Regular", size: 17)
        
        emptyView.addSubview(titleLabel)
        emptyView.addSubview(messageLabel)
        
        titleLabel.centerYAnchor.constraint(equalTo: emptyView.centerYAnchor).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: emptyView.centerXAnchor).isActive = true
        messageLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20).isActive = true
        messageLabel.leftAnchor.constraint(equalTo: emptyView.leftAnchor, constant: 20).isActive = true
        messageLabel.rightAnchor.constraint(equalTo: emptyView.rightAnchor, constant: -20).isActive = true
        
        titleLabel.text = title
        messageLabel.text = message
        messageLabel.numberOfLines = 0
        messageLabel.textAlignment = .center
        
        tableView.backgroundView = emptyView
        tableView.separatorStyle = .none
    }

    func restore() {
        tableView.backgroundView = nil
        tableView.separatorStyle = .singleLine
    }
}
