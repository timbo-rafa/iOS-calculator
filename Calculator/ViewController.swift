/*
 * Name: Rafael Timbo Matos
 * Date: September 19, 2017
 * StudentID: 300962878
 * Description: Calculator App for iOS
 * Version 0.5 - Displaying operations (bug after x)
 *
 */

import UIKit

class ViewController: UIViewController {

    var numberOnDisplay:Double = 0;
    var performingMath = true;
    
    @IBOutlet weak var labelDisplay: UILabel!
    
    @IBAction func numbers(_ sender: UIButton) {
      if performingMath == true {
        labelDisplay.text = String(sender.tag)
        performingMath = false
      }
      else {
        labelDisplay.text = labelDisplay.text! + String(sender.tag)
      }
      numberOnDisplay = Double(labelDisplay.text!)!
    }
    
    @IBAction func operations(_ sender: UIButton) {
        if labelDisplay.text != "" {
          if (sender.tag == 14) {
            labelDisplay.text = "/"
          }
          if (sender.tag == 13) {
            labelDisplay.text = "x"
          }
          if (sender.tag == 12) {
            labelDisplay.text = "-"
          }
          if (sender.tag == 11) {
            labelDisplay.text = "+"
          }
        }
    
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

