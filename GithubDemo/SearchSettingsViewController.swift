//
//  SearchSettingsViewController.swift
//  GithubDemo
//
//  Created by Douglas on 3/1/16.
//  Copyright © 2016 codepath. All rights reserved.
//

import UIKit




class SearchSettingsViewController: UIViewController {

    weak var delegate: SettingsPresentingViewControllerDelegate?

    
    @IBOutlet var slide: UISlider!
    @IBOutlet var slideValue: UILabel!
    
    var settings: GithubRepoSearchSettings?
    var newSettings: GithubRepoSearchSettings?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newSettings = settings
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func sliderChanged(sender: AnyObject) {
        sender.setValue(Float(roundf(sender.value)), animated: false)
        newSettings = settings
        newSettings!.minStars = Int(slide.value)
        print(newSettings!.minStars)
        slideValue.text = String(newSettings!.minStars)
    }
    
    @IBAction func savePressed(sender: AnyObject) {
        self.delegate?.didSaveSettings(newSettings!)
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    @IBAction func cancelPressed(sender: AnyObject) {
        self.delegate?.didCancelSettings()
        self.dismissViewControllerAnimated(true, completion: nil)
    }

}
