/* ViewController.swift
 * Name: Rafael Timbo Matos
 * Date: September 19, 2017
 * StudentID: 300962878
 * Description: Calculator App for iOS
 * based on https://www.youtube.com/watch?v=AG2QDwmj64A
 * Version 4.0 - Changed Design. Added Constraints.
 *
 * Tests:
 * OK 5*= keeps multiplying by 5 by 5 by 5...
 * OK 2+= keeps summing 2
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
    
    // VARIABLES =====================================
    // Double value for number on screen
    var numberOnDisplay:Double = 0;
    // previous number typed or calculated
    var previousNumber:Double = 0;
    // variable that tells us if an operation was the last keypress
    var performingMath = true;
    // type of operation (related to button's tag)
    var operation = 0;
    
    // label displayed on screen
    @IBOutlet weak var label: UILabel!
    
    // METHODS ==========================================
    // number keypress handler
    @IBAction func numbers(_ sender: UIButton) {
      // if an operation was the last key pressed, display should be wiped
      if performingMath == true {
        label.text = String(sender.tag)
        performingMath = false
      }
      else {
        // prevent 0 spam on display (00000)
        if label.text == "0" {
          label.text = String(sender.tag)
        } else {
          label.text = label.text! + String(sender.tag)
        }
      }
      numberOnDisplay = Double(label.text!)!
    }
    // handle plus (+), minus (-), multiply (*), and division (/) buttons
    @IBAction func operations(_ sender: UIButton) {
        if performingMath == false {
          previousNumber = Double(label.text!)!
        }
        if label.text != "" { //????
          if (sender.tag == 14) { // DIVIDE
            label.text = "/"
          }
          if (sender.tag == 13) { // MULTIPLY
            label.text = "*"
          }
          if (sender.tag == 12) { // MINUS
            label.text = "-"
          }
          if (sender.tag == 11) { // PLUS
            label.text = "+"
          }
        }
        
        operation = sender.tag
        performingMath = true
    
    }
    
    // Equal keypress handler
    @IBAction func equals(_ sender: UIButton) {
        // perform operation requested
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
    
    // C (clear) keypress handler
    @IBAction func clear(_ sender: UIButton) {
        label.text = "0"
        previousNumber = 0
        numberOnDisplay = 0
        operation = 0
    }
    
    // decimal point (.) keypress handler
    @IBAction func decimal(_ sender: UIButton) {
      let dotCharacterSet = CharacterSet(charactersIn: "." )
      // prevent multiple occurrences
      if label.text?.rangeOfCharacter(from: dotCharacterSet ) == nil {
        // prepend 0 if necessary
        if performingMath == true {
          label.text = "0."
          performingMath = false
        }
        else {
          label.text = label.text! + "."
        }
      }
      
    }
 
    
    // change sign (+-) keypress handler
    @IBAction func changeSign(_ sender: UIButton) {
        previousNumber = Double( label.text!)! * -1
        label.text = String( previousNumber )
    }
    
    // percent (%) keypress handler
    @IBAction func percent(_ sender: UIButton) {
        previousNumber = Double(label.text!)! / 100
        label.text = "%"
        operation = 13 // Multiply
        performingMath = true
    }
    
    // ANIMATION
    @IBAction func animate(_ sender: UIButton) {
      
    }
    
    // init
    override func viewDidLoad() {
        super.viewDidLoad()
        // Start displaying 0, by user experience.
        label.text = "0"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

