//
//  AlertUtil.swift
//  SearchAlgorithm
//
//  Created by hao on 2017/3/31.
//  Copyright © 2017年 Vito.Yang. All rights reserved.
//

import UIKit

public enum VitoAlertType: Int {
    case actionSheet
    case alert
    
    var uiAlertControllerStyle: UIAlertControllerStyle {
        switch self {
        case .alert:
            return .alert
        default:
            return .actionSheet
        }
    }
}

public class AlertUtil {
    class func alert(message: String, alertType: VitoAlertType = .alert) {
        let alertController = UIAlertController(title: nil, message: message, preferredStyle: alertType.uiAlertControllerStyle)
        let cancelAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        UIApplication.shared.delegate?.window??.rootViewController?.present(alertController, animated: true, completion: nil)
    }
}
