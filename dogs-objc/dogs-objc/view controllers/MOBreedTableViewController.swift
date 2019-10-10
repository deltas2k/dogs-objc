//
//  MOBreedTableViewController.swift
//  dogs-objc
//
//  Created by Matthew O'Connor on 10/10/19.
//  Copyright © 2019 Matthew O'Connor. All rights reserved.
//

import UIKit

class MOBreedTableViewController: UITableViewController {
    
    var breeds: [MOBreed] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        MODogController.shared().fetchDog({ (breeds) in
            guard let breeds = breeds else {print("no dog info");return}
            DispatchQueue.main.async {
                self.breeds = breeds
                self.tableView.reloadData()
            }
        })
        }
    

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return breeds.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "breedCell", for: indexPath)

        let dogs = breeds[indexPath.row]
        cell.textLabel?.text = dogs.name

        return cell
    }
    

   
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
//        if segue.identifier == "toDetailVC" {
//           guard let index = tableView.indexPathForSelectedRow,
//                let destinationVC = segue.destination as? MOImageViewController
//                else {return}
            
//            destinationVC.dog = dog
            
//        }
    }
    

}
