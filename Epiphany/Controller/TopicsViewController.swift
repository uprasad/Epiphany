//
//  TopicsViewController.swift
//  Epiphany
//
//  Created by Udbhav Prasad on 3/6/21.
//

import UIKit

class TopicsViewController: UICollectionViewController {
    private let topicNames: [(String, [String])] = [
        ("One and two dimensional motion", [
            "Concept 1",
            "Concept 2"
        ]),
        ("Forces and Newton's laws of motion", [
            "Concept 3",
            "Concept 4",
            "Concept 5"
        ]),
        ("Centripetal force and gravitation", [
            "Concept 6",
        ]),
        ("Impacts and linear momentum", [
            "Concept 7",
            "Concept 8",
            "Concept 9"
        ]),
        ("Work and energy", [
        ])
    ]
    
    private let sectionInsets = UIEdgeInsets(
        top: 50.0, left: 20.0, bottom: 50.0, right: 20.0
    )
    
    private let itemsPerRow: CGFloat = 2
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
    }
}

// MARK: - UICollectionViewDataSource
extension TopicsViewController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.topicNames.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell =   self.collectionView.dequeueReusableCell(withReuseIdentifier: "topicCell", for: indexPath) as! TopicViewCell
        cell.backgroundColor = .white
        cell.topicLabel.text = self.topicNames[indexPath.row].0
        
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension TopicsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let paddingSpace = self.sectionInsets.left * (self.itemsPerRow + 1)
        let availableWidth = self.view.frame.width - paddingSpace
        let widthPerItem = availableWidth / self.itemsPerRow
        
        return CGSize(width: widthPerItem, height: widthPerItem)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return self.sectionInsets
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return self.sectionInsets.left
    }
}


extension TopicsViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let cell = sender as? TopicViewCell else { return }
        guard let indexPath = self.collectionView.indexPath(for: cell) else { return }
        if segue.identifier == "openTopic" {
            if let destination = segue.destination as? ConceptsViewController {
                destination.title = self.topicNames[indexPath.row].0
                destination.concepts = self.topicNames[indexPath.row].1
            }
        }
    }
}
