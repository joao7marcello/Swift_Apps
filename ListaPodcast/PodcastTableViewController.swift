//
//  PodcastTableViewController.swift
//  ListaPodcast
//
//  Created by Student on 04/08/22.
//  Copyright © 2022 Student. All rights reserved.
//

import UIKit

class PodcastTableViewController: UITableViewController {

    var podcasts = [Podcast]()
    
    let searchController = UISearchController(searchResultsController: nil)
    var podcastsFiltrados = [Podcast]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        podcasts = PodcastDAO.getList()
        
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        definesPresentationContext = true
        tableView.tableHeaderView = searchController.searchBar
        
    }
    
    func filterContentForSearchText (searchText: String, scope: String = "all"){
        
        podcastsFiltrados = podcasts.filter({ (Podcast) -> Bool in
            return Podcast.nomePodcast.lowercased().contains(searchText.lowercased())
        })
        
        tableView.reloadData()
    }
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if searchController.isActive && searchController.searchBar.text != "" {
            return podcastsFiltrados.count
        } else {
            
            return podcasts.count
        }
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "podcast", for: indexPath)

        if let podcastCell = cell as? PodcastTableViewCell{
            
            let podcast: Podcast
            
            if searchController.isActive && searchController.searchBar.text != "" {
                podcast = podcastsFiltrados[indexPath.row]
            } else {
                podcast = podcasts[indexPath.row]
            }

            podcastCell.nomePodcastLabel.text = podcast.nomePodcast
            podcastCell.descricaoPodcastLabel.text = podcast.descricaoPodcast
            podcastCell.nomeFotoImagemPodcast.image = UIImage(named: podcast.nomeFotoPodcast)
            
            return podcastCell
            
            }

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableView.beginUpdates()
            podcasts.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.endUpdates()
            
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    
   
    
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension PodcastTableViewController: UISearchResultsUpdating{
    
    func updateSearchResults(for searchController: UISearchController) {
        
        filterContentForSearchText(searchText: searchController.searchBar.text!)
    }
}

