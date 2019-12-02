//
//  RoundImage.swift
//  Assignment
//
//  Created by Bhoopendra-28 on 02/12/2019.
//  Copyright © 2019 Bhoopendra-28. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController
{
    // Round Image Function
    func setCornerRadiusImageView(radius: Float, color: UIColor, view: UIImageView)
    {
        view.layer.cornerRadius = CGFloat(radius)
        view.clipsToBounds = true
        view.layer.borderWidth = 2
        view.layer.borderColor = color.cgColor
    }
    
    // This Function use for create first latter capital
    func showAlertC(message: String)
    {
        let alert = UIAlertController(title: Alert.titleName, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: Alert.buttonOk, style: .default, handler: nil))
        self.present(alert, animated: true)
    }
    
    // This Function use for change date formate
    func setChangeDateFormate(previousDateStr: String) -> String {
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = DateFormats.isoFormat
        let showDate = inputFormatter.date(from: previousDateStr)
        inputFormatter.dateFormat = DateFormats.orderDateFormatResult
        let resultString = inputFormatter.string(from: showDate!)
        return resultString
    }
}

// This Function use for create first latter capital
extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).uppercased() + self.lowercased().dropFirst()
    }
    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
}

