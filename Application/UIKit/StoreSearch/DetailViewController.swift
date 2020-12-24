//
//  ViewController.swift
//  StoreSearch
//
//  Created by Thao Nguyen on 24/12/2020.
//

import UIKit

class DetailViewController: UIViewController {

    // MARK: - IBOutlet
    @IBOutlet weak var popupView : UIView!
    @IBOutlet weak var artworkImageView: UIImageView!
    @IBOutlet weak var nameLabel : UILabel!
    @IBOutlet weak var artistNameLabel : UILabel!
    @IBOutlet weak var kindLabel : UILabel!
    @IBOutlet weak var genreLabel : UILabel!
    @IBOutlet weak var priceButton : UIButton!
    
    required init?(coder aDecoder : NSCoder) {
        super.init(coder: aDecoder)
        modalPresentationStyle = .custom
        transitioningDelegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // MARK: - Actions
    @IBAction func close(){
        dismiss(animated: true, completion: nil)
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


extension DetailViewController: UIViewControllerTransitioningDelegate{
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        return DimmingPresentationController(presentedViewController: presented, presenting: presenting)
    }
}
