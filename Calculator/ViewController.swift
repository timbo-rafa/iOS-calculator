/*
 * Name: Rafael Timbo Matos
 * Date: September 19, 2017
 * StudentID: 300962878
 * Description: Calculator App for iOS
 * Version 3.0 - Start with 0, by user experience
 * OK press 0...... stays 0.
 * OK press 0.5..... stays 0.5
 * OK press 0 stays 0
 * OK 3 + 2 = 5, then = presses keep adding 2
 * OK 2 + 2 = 4, then 5 + 5 gives 10
 * OK 2 + 2 = 4, then +- displays -4, then = gives -2 (added 2)
 * OK .5 / 0.2 = 2.5, then equals gives 12.5 and keeps going
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
        if label.text == "0" {
          label.text = String(sender.tag)
        } else {
          label.text = label.text! + String(sender.tag)
        }
      }
      numberOnDisplay = Double(label.text!)!
        // Prevent 0 spamming on screen
        if label.text == "00" {
            label.text = "0"
        }
    }
    
    @IBAction func operations(_ sender: UIButton) {
        if performingMath == false {
          previousNumber = Double(label.text!)!
        }
        if label.text != "" { //????
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
        if operation == 14 { // DIVIDE
            label.text = String(previousNumber / numberOnDisplay)
        }
        else if operation == 13 { // MULTIPLY
            label.text = String(previousNumber * numberOnDisplay)
        }
        else if operation == 12 { // MINUS
            label.text = String(previousNumber - numberOnDisplay)
        }
        else if operation == 11 { // PLUS
            label.text = String(previousNumber + numberOnDisplay)
        }
        performingMath = true
        previousNumber = Double(label.text!)!
    }
    
    @IBAction func clear(_ sender: UIButton) {
        label.text = "0"
        previousNumber = 0
        numberOnDisplay = 0
        operation = 0
    }
    
    @IBAction func decimal(_ sender: UIButton) {
      let dotCharacterSet = CharacterSet(charactersIn: "." )
      if label.text?.rangeOfCharacter(from: dotCharacterSet ) == nil {
        if label.text == "" {
          label.text = "0."
        }
        else if performingMath == true {
          label.text = "0."
          performingMath = false
        }
        else {
          label.text = label.text! + "."
        }
      }
      
    }
    
    @IBAction func changeSign(_ sender: UIButton) {
        previousNumber = Double( label.text!)! * -1
        label.text = String( previousNumber )
    }
    
    @IBAction func percent(_ sender: UIButton) {
        previousNumber = Double(label.text!)! / 100
        label.text = "%"
        operation = 13 // Multiply
        performingMath = true
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Start with 0, by user experience.
        label.text = "0"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

