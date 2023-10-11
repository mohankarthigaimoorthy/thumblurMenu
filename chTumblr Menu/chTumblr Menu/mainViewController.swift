//
//  mainViewController.swift
//  chTumblr Menu
//
//  Created by Imcrinox Mac on 18/12/1444 AH.
//

import UIKit

class mainViewController: subViewController {

    let transitionManager = MenuTransitionManager()
    
    @IBOutlet weak var textBtn: UIButton!
    @IBOutlet weak var textLbl: UILabel!
    
    @IBOutlet weak var photoBtn: UIButton!
    @IBOutlet weak var photoLbl: UILabel!
    
    @IBOutlet weak var quoteBtn: UIButton!
    @IBOutlet weak var quoteLbl: UILabel!
    
    @IBOutlet weak var linkBtn: UIButton!
    @IBOutlet weak var linkLbl: UILabel!
    
    
    @IBOutlet weak var chatBtn: UIButton!
    @IBOutlet weak var chatLbl: UILabel!
    
    @IBOutlet weak var musicBtn: UIButton!
    @IBOutlet weak var musicLbl: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.transitioningDelegate = self.transitionManager
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
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
