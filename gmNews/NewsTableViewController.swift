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

class NewsTableViewController: UITableViewController {
    
    let newsAPI = NewsAPI(apiKey: "9442852d248a42ae99a51dfe4189c0e5")
    var articles = [NewsArticle]() {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
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
            case .failure(let error):
                print(error)
            }
        }
    }
    
    
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "newsSource", for: indexPath) as! ArticleTableViewCell
        
        cell.sourceName.text = articles[indexPath.row].source.name
        cell.articleText.text = articles[indexPath.row].articleDescription
        return cell
    }
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
