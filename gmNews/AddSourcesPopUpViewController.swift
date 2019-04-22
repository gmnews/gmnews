//
//  AddSourcesPopUpViewController.swift
//  gmNews
//
//  Created by Faith Shatto on 4/15/19.
//  Copyright © 2019 Martin Landin. All rights reserved.
//

import UIKit
import NewsAPISwift

class AddSourcesPopUpViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    let newsAPI = NewsAPI(apiKey: "9442852d248a42ae99a51dfe4189c0e5")
    var sources = [NewsSource]() {
        didSet {
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBAction func onSkip(_ sender: Any) {
        self.performSegue(withIdentifier: "SourcesToHomeSegue", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        loadSources()
    }
    
    func loadSources() {
        newsAPI.getSources(country: .us) { result in
            switch result{
            case .success(let sources):
                self.sources = sources
                print(sources)
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
        
        return cell
    }

}
