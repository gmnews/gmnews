//
//  AddSourcesPopUpViewController.swift
//  gmNews
//
//  Created by Faith Shatto on 4/15/19.
//  Copyright © 2019 Martin Landin. All rights reserved.
//

import UIKit
import NewsAPISwift
import Parse

class AddSourcesPopUpViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    let newsAPI = NewsAPI(apiKey: "9442852d248a42ae99a51dfe4189c0e5")
    var sources = [NewsSource]() {
        didSet {
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
    var selectedSources: [String] = []
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBAction func onSkip(_ sender: Any) {
        self.performSegue(withIdentifier: "SourcesToHomeSegue", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.allowsMultipleSelection = true
        
        loadSources()
    }
    
    func loadSources() {
        let country = PFUser.current()?.object(forKey: "country") as? String
        let abr = country?.prefix(2).lowercased()
        print(String(abr!))
        
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
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sources.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NewsSourceCell", for: indexPath) as! NewsSourceCell

        let source = sources[indexPath.item]
        
        cell.sourceName?.text = source.name
        //cell.sourceId = source.id
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell : UICollectionViewCell = collectionView.cellForItem(at: indexPath)!

        let sCell = sources[indexPath.item]
        selectedSources.append(sCell.id)
        
        cell.backgroundColor = UIColor.orange
        cell.layer.borderWidth = 2
    }

    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let unselectedCell : UICollectionViewCell = collectionView.cellForItem(at: indexPath)!

        let uCell = sources[indexPath.item]
        if let index = selectedSources.firstIndex(of: uCell.id){
            selectedSources.remove(at: index)
        }

        unselectedCell.backgroundColor = UIColor.clear
        unselectedCell.layer.borderWidth = 0
    }
}
