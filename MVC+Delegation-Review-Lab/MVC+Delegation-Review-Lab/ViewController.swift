//
//  ViewController.swift
//  MVC+Delegation-Review-Lab
//
//  Created by Benjamin Stone on 8/19/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var fontSize: CGFloat = 14 {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Settings", style: .plain, target: self, action: #selector(openSetting))
        self.title = "Movies"
    }
    @objc func openSetting() {
        guard let viewController = storyboard?.instantiateViewController(withIdentifier: "ChangeFontViewController") as? ChangeFontViewController else { fatalError() }
        viewController.delegate = self
        viewController.currentFontSize = Double(fontSize)
        navigationController?.pushViewController(viewController, animated: true)
    }

}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Movie.allMovies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "vanillaCell", for: indexPath)
        cell.textLabel?.text = Movie.allMovies[indexPath.row].name
        cell.detailTextLabel?.text = String(Movie.allMovies[indexPath.row].year)
        cell.textLabel?.font = cell.textLabel?.font.withSize(fontSize)
        cell.detailTextLabel?.font = cell.textLabel?.font
        return cell
    }
    
   
}

extension ViewController: viewControllerTextSizeDelegate {
    func changeSize(value: CGFloat) {
        fontSize = value
    }
    
    
}
