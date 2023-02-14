//
//  FlickrImageResultCell.swift
//  VSCO-lite
//
//  Created by Quinn Ellis on 2/13/23.
//

import UIKit

final class FlickrImageResultCell: UICollectionViewCell {

    static let reuseIdentifier = "FlickerImageCellId"

    private lazy var resultImageView: UIImageView = {
        let imv = UIImageView()
        imv.translatesAutoresizingMaskIntoConstraints = false
        imv.contentMode = .scaleAspectFit
        imv.backgroundColor = .purple
        return imv
    }()

    private lazy var titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = .black
        return lbl
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
        contentView.addSubview(titleLabel)

        titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true

        resultImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor).isActive = true
        resultImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        resultImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        resultImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true

        // QE - Remove. Test
        resultImageView.heightAnchor.constraint(equalToConstant: .random(in: 100...600)).isActive = true
    }

    public func fillOut(with flickrPhoto: FlickrPhoto) {
        layoutIfNeeded()
        titleLabel.text = flickrPhoto.title
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        resultImageView.image = nil
    }

}
