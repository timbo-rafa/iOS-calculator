/*
 * Name: Rafael Timbo Matos
 * Date: September 19, 2017
 * StudentID: 300962878
 * Description: Calculator App for iOS
 * Version 1.1 - Trying to fix git commit username
 *
 */

import UIKit

class ViewController: UIViewController {

    var numberOnDisplay:Double = 0;
    var previousNumber:Double = 0;
    var performingMath = true;
    var operation = 0;
    
    @IBOutlet weak var label: UILabel!
    
    @IBAction func numbers(_ sender: UIButton) {
      if performingMath == true {
        label.text = String(sender.tag)
        performingMath = false
      }
      else {
        label.text = label.text! + String(sender.tag)
      }
      numberOnDisplay = Double(label.text!)!
    }
    
    @IBAction func operations(_ sender: UIButton) {
        previousNumber = Double(label.text!)!
        if label.text != "" {
          if (sender.tag == 14) {
            label.text = "/"
          }
          if (sender.tag == 13) {
            label.text = "*"
          }
          if (sender.tag == 12) {
            label.text = "-"
          }
          if (sender.tag == 11) {
            label.text = "+"
          }
        }
        
        operation = sender.tag
        performingMath = true
    
    }
    
    @IBAction func equals(_ sender: UIButton) {
        if operation == 14 {
            label.text = String(previousNumber / numberOnDisplay)
        }
        else if operation == 13 {
            label.text = String(previousNumber * numberOnDisplay)
        }
        else if operation == 12 {
            label.text = String(previousNumber - numberOnDisplay)
        }
        else if operation == 11 {
            label.text = String(previousNumber + numberOnDisplay)
        }
    }
    
    @IBAction func clear(_ sender: UIButton) {
        label.text = "0"
        previousNumber = 0
        numberOnDisplay = 0
        operation = 0
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

