//
//  MoviesListView.swift
//  Movies-App-iOS
//
//  Created by huda elhady on 31/03/2023.
//

import UIKit

class MoviesListView: UIViewController {

    @IBOutlet weak var tableview: UITableView!

    var presenter: MoviesListPresenterProtocol? {
        didSet {
            presenter?.view = self
        }
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        presenter?.getMoviesList()
        title = "Now Playing Movies"
    }

}
extension MoviesListView: MoviesListPresenterOutputProtocol {
    func addNewMovies() {
        tableview.reloadData()
    }
}

extension MoviesListView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.moviesCount ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MovieTableViewCell.identifier, for: indexPath) as! MovieTableViewCell
        if let presenter = self.presenter {
            presenter.configureCell(cell, at: indexPath.row)
        }
        return cell
    }
}

extension MoviesListView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.openMovieDetails(at: indexPath.row)
    }
}
