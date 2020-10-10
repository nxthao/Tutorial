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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    // TableView function
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HighScoreItem", for: indexPath)
        // Add data
        guard let nameLabel = cell.viewWithTag(10) as? UILabel, let scoreLabel = cell.viewWithTag(20) as? UILabel else{
            return cell
        }
        
        if indexPath.row == 0{
            nameLabel.text = user[0]
            scoreLabel.text = String(score[0])
        }
        else if indexPath.row == 1{
            nameLabel.text = user[1]
            scoreLabel.text = String(score[1])
        }
        else if indexPath.row == 2{
            nameLabel.text = user[2]
            scoreLabel.text = String(score[2])
        }
        else if indexPath.row == 3{
            nameLabel.text = user[3]
            scoreLabel.text = String(score[3])
        }
        return cell
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
