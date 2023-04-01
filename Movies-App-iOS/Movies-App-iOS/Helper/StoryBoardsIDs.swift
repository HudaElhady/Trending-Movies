//
//  StoryBoardsIDs.swift
//  Movies-App-iOS
//
//  Created by huda elhady on 31/03/2023.
//

import Foundation

enum StoryBoardsIDs: String {
    case main = "Main"
    
    var id: String {
        return self.rawValue
    }
}

enum ViewControllersIDs: String {
    case MoviesListVC = "MoviesListView"
    case MovieDetailsVC = "MovieDetailsView"
    
    var id: String {
        return self.rawValue
    }
}
