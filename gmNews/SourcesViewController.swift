//
//  SourcesViewController.swift
//  gmNews
//
//  Created by Gilbert Curbelo on 5/9/19.
//  Copyright © 2019 Martin Landin. All rights reserved.
//

import UIKit
import NewsAPISwift
import Parse

class SourcesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    let newsAPI = NewsAPI(apiKey: "9442852d248a42ae99a51dfe4189c0e5")
    let myColor = UIColor.init(red: 0.328, green: 0.488, blue: 0.396, alpha: 1)
    var selectedSources: [String] = []
    var prevSources: [String] = []
    var sources = [NewsSource]() {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        tableView.allowsMultipleSelection = true
        
        prevSources = (PFUser.current()?["savedSources"] as? [String])!
        
        loadSources()
    }
    
    func loadSources(){
        let country = PFUser.current()?.object(forKey: "country") as? String
        let abr = country?.prefix(2).lowercased()
        //print(String(abr!))
        
        newsAPI.getSources(country: NewsCountry(rawValue: String(abr!)) ?? .us) { result in
            switch result{
            case .success(let sources):
                self.sources = sources
                //print(sources)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    @IBAction func onDone(_ sender: Any) {
        print(selectedSources)
        PFUser.current()?["savedSources"] = selectedSources
        PFUser.current()?.saveInBackground()
        self.dismiss(animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sources.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsSourceTableViewCell") as! NewsSourceTableViewCell

        tableView.separatorColor = UIColor.orange
        
        let source = sources[indexPath.row]
        if let index = prevSources.firstIndex(of: source.id) {
            self.tableView.selectRow(at: indexPath, animated: true, scrollPosition: UITableViewScrollPosition.none)
            selectedSources.append(source.id)
        }
        
        cell.sourceName?.text = source.name
        print(source.name)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        if let cell = tableView.cellForRow(at: indexPath) as? NewsSourceTableViewCell {
//            cell.isSelected = true
//        }
        let cell : UITableViewCell = tableView.cellForRow(at: indexPath)!
//        cell.isSelected = true

        let sCell = sources[indexPath.row]
        
        if selectedSources.firstIndex(of: sCell.id) == nil{
            selectedSources.append(sCell.id)
        }
        
        cell.contentView.backgroundColor = myColor
        cell.layer.borderWidth = 0
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let unselectedCell : UITableViewCell = tableView.cellForRow(at: indexPath)!
        unselectedCell.isSelected = false
        
        let uCell = sources[indexPath.row]
        if let index = selectedSources.firstIndex(of: uCell.id){
            selectedSources.remove(at: index)
        }
        
        unselectedCell.backgroundColor = UIColor.clear
        unselectedCell.layer.borderWidth = 0
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
