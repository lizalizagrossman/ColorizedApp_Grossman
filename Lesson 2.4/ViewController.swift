//
//  ViewController.swift
//  Lesson 2.4
//
//  Created by Elizabeth on 06/02/2023.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet var segmentedControl: UISegmentedControl!
    @IBOutlet var mainLabel: UILabel!
    @IBOutlet var slider: UISlider!
    @IBOutlet var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        segmentedControl.insertSegment(withTitle: "Third", at: 2, animated: false)
        setupSlider()
        setupMainLabel()
    }
    
    // MARK: - IBActions
    @IBAction func segmentedControlAction() {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            mainLabel.text = "The first segment is selected"
            mainLabel.textColor = .red
        case 1:
            mainLabel.text = "The second segment is selected"
            mainLabel.textColor = .yellow
        default:
            mainLabel.text = "The third segment is selected"
            mainLabel.textColor = .green
        }
    }
    @IBAction func sliderAction() {
        mainLabel.text = slider.value.formatted()
        view.backgroundColor = view.backgroundColor?.withAlphaComponent(CGFloat(slider.value))
    }
    
    @IBAction func doneButtonTapped() {
        guard let inputText = textField.text, !inputText.isEmpty else {
            showAlert(withTitle: "Text field is empty", andMessage: "Please enter your name")
            return
        }
        if let _ = Double(inputText) {
            showAlert(withTitle: "Wrong Format", andMessage: "Please enter your name")
            return
        }
        mainLabel.text = textField.text
    }
    @IBAction func datePickerAction(_ sender: UIDatePicker) {
        mainLabel.text = sender.date.formatted(date: .long, time: .omitted)
    }
    
    // MARK: - Private Methods
    private func setupMainLabel() {
        mainLabel.text = slider.value.formatted()
        mainLabel.font = UIFont.systemFont(ofSize: 35)
        mainLabel.textAlignment = .center
        mainLabel.numberOfLines = 2
    }
    private func setupSlider() {
        slider.value = 1
        slider.minimumValue = 0
        slider.maximumValue = 1
        slider.minimumTrackTintColor = .yellow
        slider.maximumTrackTintColor = .red
        slider.thumbTintColor = .green
    }
}

// MARK: - UIAlertController
extension ViewController {
    private func showAlert(withTitle title: String, andMessage message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            self.textField.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

