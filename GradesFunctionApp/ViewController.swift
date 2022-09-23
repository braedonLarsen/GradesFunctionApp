//
//  ViewController.swift
//  GradesFunctionApp
//
//  Created by BRAEDON LARSEN on 9/21/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var consoleOutlet: UILabel!
    @IBOutlet weak var gradeOutlet: UITextField!
    @IBOutlet weak var receivedOutlet: UITextField!
    @IBOutlet weak var potentialOutlet: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func passFailAction(_ sender: UIButton) {
        
        if let importScore = Double(gradeOutlet.text!){
            consoleOutlet.text = passFail(score: importScore)
        }
        else {
            print("invalid score")
        }
    }
    
    @IBAction func letterGradeAction(_ sender: UIButton) {
        if let importScore = Double(gradeOutlet.text!){
            consoleOutlet.text = "you got a \(letterGrade(score:importScore))"
        }
        else {
            print("invalid input")
        }
    }
    
    @IBAction func precentageAction(_ sender: UIButton) {
        if let importEarned = Double(receivedOutlet.text!){
            if let importTotal = Double(potentialOutlet.text!){
             var output = precentageCalculator(earned: importEarned, pot: importTotal)
                consoleOutlet.text = "You got a \(output.0) and a  \(output.1)%"
            }
        }
    }
    
    
    func passFail(score: Double)-> String{
        if (score < 60 )
        {
            return "You Failed"
        }
        else {
            return "You Passed"
        }
    }
    func letterGrade(score: Double)-> String{
        if (score >= 90)
        {
            return "A"
        }
            else if (score >= 80){
                return "B"
            }
            else if (score >= 70){
                return "C"
            }
                else if (score >= 60){
                    return "D"
                }
                    else {
                        return "F"
                    }
        
    }
    func precentageCalculator(earned: Double, pot: Double)-> (String, Double){
        
        var precent = (earned / pot) * 100
        var letter = letterGrade(score: precent)
        var output = (String: letter, Double: precent)
        return output
    }
    

}

