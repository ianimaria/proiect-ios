//
//  HotelViewController.swift
//  Iani_Maria_333
//
//  Created by user216460 on 5/8/22.
//

import UIKit

final class HotelViewController: UIViewController {
    
    private var model = HotelModel()
    private let pageSize: Int = 10
    private var page: Int = 0
    private var apiKey = "JWT eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2NTE5OTA0NjQsImlhdCI6MTY1MTk4ODY2NCwibmJmIjoxNjUxOTg4NjY0LCJpZGVudGl0eSI6MTI5OX0.mY1C2FSiEMWfpWU26_PUToNAzHtbZTs8vNYpNCjcV4U"
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        requestItems()
    }
    
    private func requestItems() {
        let pathString = "https://api.makcorps.com/free/london"
        
        let headers = [
            "Authorization": "JWT eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2NTE5OTA0NjQsImlhdCI6MTY1MTk4ODY2NCwibmJmIjoxNjUxOTg4NjY0LCJpZGVudGl0eSI6MTI5OX0.mY1C2FSiEMWfpWU26_PUToNAzHtbZTs8vNYpNCjcV4U"
        ]
        
        let url = URL(string: pathString)!
        var request = URLRequest(url: url)
        request.allHTTPHeaderFields = headers
        request.httpMethod = "GET"
        print(request)
        let task = URLSession.shared.dataTask(with: request) { [weak self] data, _, error in
            if let _ = error {
                return
            }
            
            let jsonDecoder = JSONDecoder()
            guard let data = data,
                  let welf = self else { return }

            guard let comparisons = try? jsonDecoder.decode(HotelModel.self, from: data) else { return }
            welf.model.comparisons.append(contentsOf: comparisons.comparisons)
            
            DispatchQueue.main.async {
                welf.tableView.reloadData()
            }
        }
        

        task.resume()
    }
 
    private func configure() {
        title = "Hotel Views"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(HotelNewTableViewCell.self, forCellReuseIdentifier: HotelNewTableViewCell.cellId)
    }
    
}


extension HotelViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: HotelNewTableViewCell.cellId, for: indexPath)
                as? HotelNewTableViewCell else { return  UITableViewCell() }
        
        let cellModel = model.comparisons[indexPath.row]
        cell.setUp(with: cellModel)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        model.comparisons.count
    }
    
  
    
}


