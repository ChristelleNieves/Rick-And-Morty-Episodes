//
//  VideoListViewController.swift
//  nostoryboard
//
//  Created by Christelle Nieves on 5/26/21.
//

import UIKit

class ListViewController: UIViewController {
    
    var currentPage: Int? = 1
    var allEpisodes = [Episode]()
    var tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "All Episodes"
        configureTableView()
        fetchEpisodes()
    }
    
    func configureTableView() {
        
        // Set appearance
        tableView.backgroundColor = .black
        tableView.separatorColor = .white
        
        // Add the tableView to the view
        view.addSubview(tableView)
        
        // Set delegates
        setTableViewDelegates()
        
        // Set row height
        tableView.rowHeight = 100
        
        // Register cells
        tableView.register(ListCell.self, forCellReuseIdentifier: "ListCell")
        
        // Set constraints
        tableView.pin(to: view)
    }
    
    func setTableViewDelegates() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func fetchEpisodes() {
        
        let urlString = "https://rickandmortyapi.com/api/episode/?page=\(currentPage!)"
        let url = URL(string: urlString)
        
        let task = URLSession.shared.dataTask(with: url!, completionHandler: { (data, response, error) in
            guard let data = data else { return }
            
            do {
                let jsonResponse = try JSONDecoder().decode(Response.self, from: data)
                let api_response = jsonResponse
                
                // If we've reached the last page, stop sending requests to the API
                if self.currentPage == api_response.info.pages {
                    self.currentPage = nil
                    return
                }
                
                // If there is a next page, increment the current page number
                if api_response.info.next != nil {
                    
                    self.currentPage! += 1
                }
                
                // Store the results in an array
                for episode in api_response.results {
                    self.allEpisodes.append(episode)
                }
                
                // Refresh the tableView contents
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
            catch {
                print(error)
            }
        })
        task.resume()
    }
}

extension ListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        // Return the number of rows in section
        return allEpisodes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell", for: indexPath)
        cell.textLabel?.text = String(indexPath.row + 1) + ". " + allEpisodes[indexPath.row].name
        cell.backgroundColor = .black
        cell.textLabel?.textColor = .white
        
        // Make sure we're not reloading the last page repeatedly
        if self.currentPage != nil && allEpisodes[indexPath.row] == allEpisodes.last {
            fetchEpisodes()
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let rootVC = DetailViewController()
        rootVC.details = allEpisodes[indexPath.row]
        let navVC = UINavigationController(rootViewController: rootVC)
        tableView.deselectRow(at: indexPath, animated: true)
        
        present(navVC, animated: true)
    }
}
