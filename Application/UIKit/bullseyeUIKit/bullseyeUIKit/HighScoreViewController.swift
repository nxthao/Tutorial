//
//  HighScoreViewController.swift
//  bullseyeUIKit
//
//  Created by Thao Nguyen on 10/9/20.
//

import UIKit

class HighScoreViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    @IBOutlet weak var tableView : UITableView!
    let user = ["Thao", "Nguyen", "Dao", "Hieu"]
    let score = [100, 110, 120, 90]
    var items = [HighScoreItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        resetHighScore()
    }
    
    @IBAction func resetHighScore(){
        let item0 = HighScoreItem()
        item0.name = user[0]
        item0.score = score[0]
        items.append(item0)
        
        let item1 = HighScoreItem()
        item1.name = user[1]
        item1.score = score[1]
        items.append(item1)
        
        let item2 = HighScoreItem()
        item2.name = user[2]
        item2.score = score[2]
        items.append(item2)
        
        let item3 = HighScoreItem()
        item3.name = user[3]
        item3.score = score[3]
        items.append(item3)
        
        tableView.reloadData()
    }
    
    // TableView function
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HighScoreItem", for: indexPath)
        // Add data
        guard let nameLabel = cell.viewWithTag(10) as? UILabel, let scoreLabel = cell.viewWithTag(20) as? UILabel else{
            return cell
        }
        
        // Take object at current indexPath
        let item = items[indexPath.row]
        
        nameLabel.text = item.name
        scoreLabel.text = String(item.score)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        items.remove(at: indexPath.row)
        
        let indexPaths = [indexPath]
        tableView.deleteRows(at: indexPaths, with: .automatic)
    }
    
    // MARK: - TableView delegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
