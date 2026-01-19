//
//  ViewController.swift
//  Counter
//
//  Created by Мамытов Руслан on 19.01.2026.
//

import UIKit

final class ViewController: UIViewController {

    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var incrementButton: UIButton!
    @IBOutlet weak var decrementButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var historyTextView: UITextView!
    
    private var count: Int = 0
    private var history: String = "История изменений:\n"
    private let dateFormatter = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dateFormatter.dateFormat = "dd.MM.yyyy HH:mm"
        dateFormatter.locale = Locale.current
        historyTextView.text = history
    }

    @IBAction func incrementCounter() {
        let dateString = getDateString()
        count += 1
        history += "[\(dateString)]: значение изменено на +1\n"
        updateUi()
    }
    
    @IBAction func decrementCounter() {
        let dateString = getDateString()
        if count > 0 {
            history += "[\(dateString)]: значение изменено на -1\n"
            count -= 1
        } else {
            history += "[\(dateString)]: попытка уменьшить значение счётчика ниже 0\n"
        }
        updateUi()
    }
    
    @IBAction func resetCounter() {
        let dateString = getDateString()
        count = 0
        history += "[\(dateString)]: значение сброшено\n"
        updateUi()
    }
    
    func updateUi() {
        counterLabel.text = "Значение счётчика: \(count)"
        historyTextView.text = history
    }
    
    func getDateString() -> String {
        let date = Date()
        return dateFormatter.string(from: date)
    }
    
}
