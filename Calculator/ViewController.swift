/* ViewController.swift
 * Name: Rafael Timbo Matos
 * Date: September 19, 2017
 * StudentID: 300962878
 * Description: Calculator App for iOS
 * based on https://www.youtube.com/watch?v=AG2QDwmj64A
 * Version 8.0 - Label inequality constraint for better landscape fitting
 *
 * Tests:
 * OK C as first keypress
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
    // variable that tells us the operation that was the last requested
    var performingMath = false;
    // type of operation (related to button's tag)
    var operation: UIButton!;
    
    // label displayed on screen
    @IBOutlet weak var label: UILabel!
    // Buttons
    @IBOutlet weak var zero: UIButton!
    @IBOutlet weak var decimalPoint: UIButton!
    @IBOutlet weak var equal: UIButton!
    @IBOutlet weak var plus: UIButton!
    @IBOutlet weak var minus: UIButton!
    @IBOutlet weak var multiply: UIButton!
    @IBOutlet weak var divide: UIButton!
    @IBOutlet weak var percent: UIButton!
    @IBOutlet weak var changeSign: UIButton!
    @IBOutlet weak var clear: UIButton!
    @IBOutlet weak var one: UIButton!
    @IBOutlet weak var two: UIButton!
    @IBOutlet weak var three: UIButton!
    @IBOutlet weak var four: UIButton!
    @IBOutlet weak var five: UIButton!
    @IBOutlet weak var six: UIButton!
    @IBOutlet weak var seven: UIButton!
    @IBOutlet weak var eight: UIButton!
    @IBOutlet weak var nine: UIButton!
    // unused button
    @IBOutlet weak var voidButton: UIButton!
    
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
        if performingMath == false { //bug fix for multiple presses
          previousNumber = Double(label.text!)!
        }
        if label.text != "" { //????
          if (sender.tag == 15) { // PERCENT
            label.text = "%"
            previousNumber /= 100
          }
          else if (sender.tag == 14) { // DIVIDE
            label.text = "/"
          }
          else if (sender.tag == 13) { // MULTIPLY
            label.text = "*"
          }
          if (sender.tag == 12) { // MINUS
            label.text = "-"
          }
          if (sender.tag == 11) { // PLUS
            label.text = "+"
          }
        }
        operation = sender
        performingMath = true
        showBorder(operation)
    }
    
    // Equal keypress handler
    @IBAction func equals(_ sender: UIButton) {
        // perform operation requested
        if operation.tag == 15 { // PERCENT
            label.text = String(previousNumber * numberOnDisplay)
            // bug fix: state we are doing multiply explicitly
            operation = multiply
            showBorder(multiply)
        }
        if operation.tag == 14 { // DIVIDE
            label.text = String(previousNumber / numberOnDisplay)
        }
        else if operation.tag == 13 { // MULTIPLY
            label.text = String(previousNumber * numberOnDisplay)
        }
        else if operation.tag == 12 { // MINUS
            label.text = String(previousNumber - numberOnDisplay)
        }
        else if operation.tag == 11 { // PLUS
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
        hideBorder( operation )
    }
    
    // decimal point (.) keypress handler
    @IBAction func decimal(_ sender: UIButton) {
      let dotCharacterSet = CharacterSet(charactersIn: "." )
      
      // prepend 0 if necessary
      if performingMath == true {
        label.text = "0."
        performingMath = false
      }
        
      // prevent multiple decimal points
      if label.text?.rangeOfCharacter(from: dotCharacterSet ) == nil {
        label.text = label.text! + "."
      }
      
    }
    
    // change sign (+-) keypress handler
    @IBAction func changeSign(_ sender: UIButton) {
        previousNumber = Double( label.text!)! * -1
        label.text = String( previousNumber )
    }
    
    // set up button corners
    func buttonCorners() {
        zero.layer.cornerRadius = 5
        one.layer.cornerRadius = 5
        two.layer.cornerRadius = 5
        three.layer.cornerRadius = 5
        four.layer.cornerRadius = 5
        five.layer.cornerRadius = 5
        six.layer.cornerRadius = 5
        seven.layer.cornerRadius = 5
        eight.layer.cornerRadius = 5
        nine.layer.cornerRadius = 5
        decimalPoint.layer.cornerRadius = 5
        equal.layer.cornerRadius = 5
        plus.layer.cornerRadius = 5
        minus.layer.cornerRadius = 5
        multiply.layer.cornerRadius = 5
        divide.layer.cornerRadius = 5
        percent.layer.cornerRadius = 5
        changeSign.layer.cornerRadius = 5
        clear.layer.cornerRadius = 5
        voidButton.layer.cornerRadius = 5
        
        plus.layer.borderColor = UIColor.white.cgColor
        minus.layer.borderColor = UIColor.white.cgColor
        multiply.layer.borderColor = UIColor.white.cgColor
        divide.layer.borderColor = UIColor.white.cgColor
        percent.layer.borderColor = UIColor.white.cgColor
        
    }
    
    func showBorder(_ sender: UIButton) {
        hideBorder(plus)
        hideBorder(minus)
        hideBorder(multiply)
        hideBorder(divide)
        hideBorder(percent)
        sender.layer.borderWidth = 2
    }
    func hideBorder(_ sender: UIButton) {
            sender.layer.borderWidth = 0
    }

    // init
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonCorners()
        // bug fix for clear keypress before any operation
        operation = voidButton
        // Start displaying 0, by user experience.
        label.text = "0"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

