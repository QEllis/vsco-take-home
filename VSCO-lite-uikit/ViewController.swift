import UIKit

class ViewController: UIViewController {

    private lazy var searchBar: UISearchBar = {
        let sb = UISearchBar()
        sb.translatesAutoresizingMaskIntoConstraints = false
        sb.placeholder = "Search Flickr"
        return sb
    }()

    private lazy var resultsCV: UICollectionView = {
        let cv = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.backgroundColor = .yellow
        return cv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
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
