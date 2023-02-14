import UIKit

class ViewController: UIViewController {

    private lazy var searchBar: UISearchBar = {
        let sb = UISearchBar()
        sb.translatesAutoresizingMaskIntoConstraints = false
        sb.placeholder = "Search Flickr"
        return sb
    }()

    private lazy var resultsCV: UICollectionView = {
        let cv = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.delegate = self
        cv.dataSource = self
        cv.backgroundColor = .yellow
        return cv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()
        setLayout()
    }

    private func registerCells() {
        resultsCV.register(FlickrImageResultCell.self, forCellWithReuseIdentifier: FlickrImageResultCell.reuseIdentifier)
    }

    private func setLayout() {
        view.addSubview(searchBar)
        view.addSubview(resultsCV)

        searchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16).isActive = true
        searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        searchBar.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        searchBar.heightAnchor.constraint(equalToConstant: 48).isActive = true

        resultsCV.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 16).isActive = true
        resultsCV.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        resultsCV.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        resultsCV.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }

}

// MARK: - UICollectionViewDelegate, UICollectionViewDataSource

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FlickrImageResultCell.reuseIdentifier, for: indexPath)
        return cell
    }

}

// MARK: - UICollectionViewCompositionalLayout

extension ViewController {

    private func createLayout() -> UICollectionViewCompositionalLayout {
        let configuration = UICollectionViewCompositionalLayoutConfiguration()
        let layout = UICollectionViewCompositionalLayout(sectionProvider: { (_, _) -> NSCollectionLayoutSection? in
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(1))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)

            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(1))
            let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])

            let section = NSCollectionLayoutSection(group: group)
            section.interGroupSpacing = 8
            section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 16, bottom: 16, trailing: 16)
            return section
        }, configuration: configuration)
        return layout
    }

}
