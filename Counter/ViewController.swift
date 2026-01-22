//
//  ViewController.swift
//  Counter
//
//  Created by Мамытов Руслан on 19.01.2026.
//

import UIKit

final class ViewController: UIViewController {
    
    private let dateFormatter = DateFormatter()
    
    @IBOutlet private weak var counterLabel: UILabel!
    @IBOutlet private weak var incrementButton: UIButton!
    @IBOutlet private weak var decrementButton: UIButton!
    @IBOutlet private weak var resetButton: UIButton!
    @IBOutlet private weak var historyTextView: UITextView!
    
    private var count: Int = 0
    
    private var history: String = "История изменений:\n"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dateFormatter.dateFormat = "dd.MM.yyyy HH:mm"
        dateFormatter.locale = Locale.current
        historyTextView.text = history
    }
    
    private func getDateString() -> String {
        let date = Date()
        return dateFormatter.string(from: date)
    }
    
    private func updateUi() {
        counterLabel.text = "Значение счётчика: \(count)"
        historyTextView.text = history
    }

    @IBAction private func incrementCounter() {
        let dateString = getDateString()
        count += 1
        history += "[\(dateString)]: значение изменено на +1\n"
        updateUi()
    }
    
    @IBAction private func decrementCounter() {
        let dateString = getDateString()
        if count > 0 {
            history += "[\(dateString)]: значение изменено на -1\n"
            count -= 1
        } else {
            history += "[\(dateString)]: попытка уменьшить значение счётчика ниже 0\n"
        }
        updateUi()
    }
    
    @IBAction private func resetCounter() {
        let dateString = getDateString()
        count = 0
        history += "[\(dateString)]: значение сброшено\n"
        updateUi()
    }
    
}
