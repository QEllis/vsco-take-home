//
//  FlickrImageResultCell.swift
//  VSCO-lite
//
//  Created by Quinn Ellis on 2/13/23.
//

import UIKit

final class FlickrImageResultCell: UICollectionViewCell {

    private lazy var resultImageView: UIImageView = {
        let imv = UIImageView()
        imv.translatesAutoresizingMaskIntoConstraints = false
        imv.contentMode = .scaleAspectFit
        imv.backgroundColor = .purple
        return imv
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }

    private func commonInit() {
        setLayout()
    }

    private func setLayout() {
        contentView.addSubview(resultImageView)
        resultImageView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        resultImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        resultImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        resultImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        resultImageView.image = nil
    }

}
