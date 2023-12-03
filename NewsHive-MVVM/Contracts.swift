//
//  NewsContracts.swift
//  NewsHive-MVVM
//
//  Created by Ahmet Enes Irmak on 30.11.2023.
//

import UIKit

//MARK: - NewsList ViewModel Delegate
protocol NewsListViewModelDelegate {
    func dataUpdated()
}


//MARK: - Coordinator
protocol NewsCoordinator {
    var childCoordinators: [NewsCoordinator] { get }
    var navigationController: UINavigationController { get }
    
    func startCoordinator()
}
