//
//  MessagesTableViewHeader.swift
//  Figma
//
//  Created by Никита Ляпустин on 03.10.2021.
//

import UIKit

class MessagesTableViewHeader: UIView {

    // MARK: - Instance Properties

    private let pinnedLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.habibi(with: 12)
        label.textColor = .label
        label.text = "PINNED"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.addCharacterSpacing(kernValue: 1.15)
        return label
    }()
    
    // MARK: - Initializators

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Instance Methods

    // MARK: -

    private func setup() {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        layout.itemSize = CGSize(width: 48, height: 72)
        layout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: CGRect(x: 0, y: 43, width: self.frame.height, height: 92), collectionViewLayout: layout)
        collectionView.register(PinnedCollectionViewCell.self, forCellWithReuseIdentifier: PinnedCollectionViewCell.identifier)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear

        addSubview(pinnedLabel)
        addSubview(collectionView)
        collectionView.dataSource = self
        collectionView.delegate = self

        let pinnedLabelConstaints = [
            NSLayoutConstraint(item: pinnedLabel, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 11),
            NSLayoutConstraint(item: pinnedLabel, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1, constant: 24),
            pinnedLabel.heightAnchor.constraint(equalToConstant: 16),
        ]
        NSLayoutConstraint.activate(pinnedLabelConstaints)
        
        let collectionViewConstraints = [
            NSLayoutConstraint(item: collectionView, attribute: .top, relatedBy: .equal, toItem: pinnedLabel, attribute: .bottom, multiplier: 1, constant: 16),
            NSLayoutConstraint(item: collectionView, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: collectionView, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1, constant: 0),
            collectionView.heightAnchor.constraint(equalToConstant: 92),
            NSLayoutConstraint(item: collectionView, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1, constant: 0)
        ]
        NSLayoutConstraint.activate(collectionViewConstraints)
        
        self.addBorders(edges: [.bottom], color: .separator, thickness: 0.5)
    }
}

    // MARK: - UICollectionViewDataSource Methods

extension MessagesTableViewHeader: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        min(Data.pinnedProfileImages.count, Data.pinnedNames.count)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PinnedCollectionViewCell.identifier, for: indexPath) as? PinnedCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.profileImage = Data.pinnedProfileImages[indexPath.row]
        cell.profileName = Data.pinnedNames[indexPath.row]
        return cell
    }
}

    // MARK: - UICollectionViewDelegateFlowLayout Methods

extension MessagesTableViewHeader: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 64, height: 100)
    }
}
