/*
 *  AppDelegate.swift
 *  BitcoinApp
 *
 *  Created by Tuigynbekov Yelzhan on 19.04.2021.
 */

import UIKit
import SnapKit


#warning("TODO")
/*
 1. • Изучите документацию: https://www.coindesk.com/api/ ; https://www.bitstamp.net/api/
 2. • Экран - список последних транзакций по покупке и продаже биткоинов.
 3. • Необходимо отобразить список транзакций по биткоинам - выводимое количество ограничить 500 шт. Необходимо отобразить количество купленных или проданных биткоинов, дату и время транзакции, тип транзакции (покупка/продажа).
 4.• При нажатии на транзакцию, вывести подробную информацию о транзакции (количество, по какому курсу к доллару была покупка/продажа, дата и время транзакции, ID и на какую сумму проходила операция).
 5. • Конвертер валюты по курсу к биткоину. В зависимости от введенной суммы - отобразить сколько биткоинов можно купить или на какую сумму можно продать биткоинов.
 6. • Валют будет 3:
    - Американский доллар (USD)
    - Евро (EUR)
    - Тенге (KZT) .
*/


@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        RunLoop.current.run(until: Date(timeIntervalSinceNow: 1.5))
        
        setupWindow()
        
        return true
    }
    
    func setupWindow() {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.rootViewController = TabbarViewController()
        
    }
    
    func setupNeeds() {
        
        if #available(iOS 13.0, *) { window?.overrideUserInterfaceStyle = .light }
        
    }

}

