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
        imv.backgroundColor = .clear
        return imv
    }()

    private lazy var loadingIndicator: UIActivityIndicatorView = {
        let act = UIActivityIndicatorView()
        act.translatesAutoresizingMaskIntoConstraints = false
        act.style = .medium
        act.color = .black
        act.hidesWhenStopped = true
        return act
    }()

    private var imageDataTask: URLSessionDataTask?

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
        contentView.addSubview(loadingIndicator)

        resultImageView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        resultImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        resultImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        resultImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true

        loadingIndicator.centerXAnchor.constraint(equalTo: resultImageView.centerXAnchor).isActive = true
        loadingIndicator.centerYAnchor.constraint(equalTo: resultImageView.centerYAnchor).isActive = true
    }

    public func fillOut(with flickrPhoto: FlickrPhoto) {
        guard let imageUrl = URL(string: flickrPhoto.imageUrl) else { return }

        loadingIndicator.startAnimating()

        imageDataTask = FlickrAPI().fetchImageData(for: imageUrl, completion: { [weak self] imageData in
            guard let self = self,
                  let imageData = imageData else { return }
            DispatchQueue.main.async {
                self.setImage(with: imageData)
            }
        })
    }

    private func setImage(with imageData: Data) {
        loadingIndicator.stopAnimating()
        guard let image = UIImage(data: imageData) else {
            resultImageView.backgroundColor = .black
            return
        }
        resultImageView.image = image
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        // Cancel Image Data Task and clear image
        imageDataTask?.cancel()
        imageDataTask = nil
        resultImageView.image = nil
    }

}
