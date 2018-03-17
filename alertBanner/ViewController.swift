//
//  ViewController.swift
//  alertBanner
//
//  Created by Eduardo dos santos on 23/02/2018.
//  Copyright © 2018 Eduardo dos santos. All rights reserved.
//

import UIKit

extension UIViewController {
    
    @objc func closeView() {
        print("Fechar Menu")
    }
    
    func alertBanner(backgroudColor: UIColor, textColor: UIColor, titleString: String, descriptionString: String, delayDuration: Double) {
        
        print("Call alertBanner")
        
        var notificationView = UIView()
        let widthNotification = Int(UIScreen.main.bounds.width)
        var heightNotification = 80
        let heightNotificationShadow = 2
        
        //Create a view
        notificationView = UIView(frame: CGRect(x: 0, y: -(heightNotification + heightNotificationShadow), width: widthNotification, height: heightNotification))
        notificationView.backgroundColor = backgroudColor
        notificationView.layer.shadowColor = UIColor(red:0/255.0, green:0/255.0, blue:0/255.0, alpha: 1.0).cgColor
        notificationView.layer.shadowOffset = CGSize(width: 0, height: heightNotificationShadow)
        notificationView.layer.shadowOpacity = 0.7
        notificationView.isUserInteractionEnabled = true
        
        //Add View
        self.view.addSubview(notificationView)
        
        //Above navigation
        UIApplication.shared.keyWindow?.addSubview(notificationView)
        self.view.window?.windowLevel = UIWindowLevelStatusBar + 1
        
        let swipeGesture = UITapGestureRecognizer(target: self, action: #selector(closeView))
        swipeGesture.numberOfTapsRequired = 1
        notificationView.addGestureRecognizer(swipeGesture)
        
        //Add Title
        let title = UILabel(frame: CGRect(x:0, y:0, width:notificationView.frame.width, height:20))
        title.center = CGPoint(x: (UIScreen.main.bounds.width / 2), y:30)
        title.textColor = textColor
        title.textAlignment = NSTextAlignment.center
        title.text = titleString
        title.isUserInteractionEnabled = true
        notificationView.addSubview(title)
        
        //Add Description
        let description = UILabel(frame: CGRect(x:0, y:0, width:widthNotification, height:20))
        description.center = CGPoint(x: (UIScreen.main.bounds.width / 2), y:55)
        description.textColor = textColor
        description.textAlignment = NSTextAlignment.center
        description.text = descriptionString
        description.numberOfLines = 0
        description.adjustsFontSizeToFitWidth = true
        description.sizeToFit()
        description.isUserInteractionEnabled = true
        notificationView.addSubview(description)
        
        heightNotification = Int(description.frame.height + title.frame.height + 30)
        
        notificationView.frame = CGRect(x: 0, y: -(heightNotification + heightNotificationShadow), width: Int(UIScreen.main.bounds.width), height: heightNotification)
        
        UIView.animate(withDuration: 0.7, delay: 0.0, options: [.curveEaseInOut], animations: {
            print("End animation open")
            notificationView.frame = CGRect(x: 0, y: 0, width: widthNotification, height: heightNotification)
        }, completion: { (finished: Bool) in
            UIView.animate(withDuration: 0.7, delay: delayDuration, options: [.curveEaseInOut], animations: {
                print("End animation close")
                notificationView.frame = CGRect(x: 0, y: -(heightNotification + heightNotificationShadow), width: Int(UIScreen.main.bounds.width), height: 80)
            }, completion: { (finished: Bool) in
                print("Finish all animation")
                //Delete all subviews
                notificationView.removeFromSuperview()
                self.view.window?.windowLevel = UIWindowLevelStatusBar - 1
            })
        })
        
    }
    
}

class ViewController: UIViewController {
    
    override func viewDidLoad() {
//      Testando uma view avulsa e o tapgesture
//        var view_ = UIView()
//        view_ = UIView(frame: CGRect(x: 80, y: 80, width: 100, height: 80))
//        view_.backgroundColor = .white
//
//        self.view.addSubview(view_)
//
//        let swipeGesture = UITapGestureRecognizer(target: self, action: #selector(closeView))
//        swipeGesture.numberOfTapsRequired = 1
//        view_.addGestureRecognizer(swipeGesture)
        
    }
    
    @IBAction func showSuccess(_ sender: Any) {
        print("Call showSuccess with delay 4 seconds")
        self.alertBanner(backgroudColor: .green,textColor: .white,titleString: "Teste Banner Success",descriptionString: "Teste banner description very very very long, the book is on the table and the table is off the book \n Teste banner description very very very long, the book is on the table and the table is off the book",delayDuration: 4.0)
    }
    
    @IBAction func showDanger(_ sender: Any) {
        print("Call showDanger")
        self.alertBanner(backgroudColor: .red,textColor: .white,titleString: "Teste Banner Danger",descriptionString: "Teste banner description very very very long, the book is on the table and the table is off the book",delayDuration: 2.0)
    }
    
    @IBAction func showWarning(_ sender: Any) {
        print("Call showWarning")
        self.alertBanner(backgroudColor: .yellow,textColor: .black,titleString: "Teste Banner Warning",descriptionString: "Teste banner description long, the book is on the table",delayDuration: 2.0)
    }
    
    @IBAction func showInfo1(_ sender: Any) {
        print("Call showInfo1")
        self.alertBanner(backgroudColor: .lightGray,textColor: .white,titleString: "Teste Banner Default",descriptionString: "Teste banner description long, the book is on the table",delayDuration: 2.0)
    }
    
    @IBAction func showInfo2(_ sender: Any) {
        print("Call showInfo2")
        self.alertBanner(backgroudColor: .black,textColor: .white,titleString: "Teste Banner Default black",descriptionString: "Teste banner description short",delayDuration: 2.0)
    }

}

