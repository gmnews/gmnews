//
//  EditSourcesViewController.swift
//  gmNews
//
//  Created by Gilbert Curbelo on 5/8/19.
//  Copyright © 2019 Martin Landin. All rights reserved.
//

import UIKit
import NewsAPISwift
import Parse

class EditSourcesViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    let newsAPI = NewsAPI(apiKey: "9442852d248a42ae99a51dfe4189c0e5")
    var sources = [NewsSource]() {
        didSet {
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
    //@IBOutlet weak var srcName: UILabel!
    @IBOutlet weak var sourceLogo: UIImageView!
    let myColor = UIColor.init(red: 0.328, green: 0.488, blue: 0.396, alpha: 1)
    var selectedSources: [String] = []
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBAction func onDone(_ sender: Any) {
        print(selectedSources)
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.indicatorStyle = UIScrollViewIndicatorStyle.black
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
        if cell.isSelected == true {
            cell.backgroundColor = myColor
            //cell.backgroundColor = UIColor.orange
            cell.layer.borderWidth = 2
            cell.layer.borderColor = myColor.cgColor
            cell.sourceName.textColor = UIColor.white
        } else {
            cell.backgroundColor = UIColor.clear
            cell.layer.borderWidth = 0
        }
        
        let source = sources[indexPath.item]
        
//        DispatchQueue.global(qos: .userInitiated).async{
//            let imageData:NSData = NSData(contentsOf: source.url)
//            cell.imageView = UIImageView(frame: CGRect(x:0, y:0, width: 200, height: 200))
//            DispatchQueue.main.async {
//                let image = UIImage(data: imageData as Data)
//                cell.sourceLogo = image
//            }
//        }
        
        cell.sourceName?.text = source.name
        //cell.sourceId = source.id
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell : UICollectionViewCell = collectionView.cellForItem(at: indexPath)!
        cell.isSelected = true
        
        let sCell = sources[indexPath.item]
        selectedSources.append(sCell.id)
        
        //cell.backgroundColor = UIColor.darkGray
        cell.backgroundColor = UIColor.init(red: 0.328, green: 0.488, blue: 0.396, alpha: 1)
        
        
        cell.layer.borderWidth = 0
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let unselectedCell : UICollectionViewCell = collectionView.cellForItem(at: indexPath)!
        unselectedCell.isSelected = false
        
        let uCell = sources[indexPath.item]
        if let index = selectedSources.firstIndex(of: uCell.id){
            selectedSources.remove(at: index)
        }
        
        unselectedCell.backgroundColor = UIColor.clear
        unselectedCell.layer.borderWidth = 0
    }

}
