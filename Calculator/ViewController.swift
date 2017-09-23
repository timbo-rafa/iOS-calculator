/*
 * Name: Rafael Timbo Matos
 * Date: September 19, 2017
 * StudentID: 300962878
 * Description: Calculator App for iOS
 * Version 0.3 - Displaying number keypresses
 *
 */

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var labelDisplay: UILabel!
    
    @IBAction func numbers(_ sender: UIButton) {
      labelDisplay.text = labelDisplay.text! + String(sender.tag)
    
    
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

