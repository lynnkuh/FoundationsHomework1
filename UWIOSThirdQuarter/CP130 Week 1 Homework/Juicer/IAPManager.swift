//
//  IAPManager.swift
//  Juicr
//
//  Created by Regular User on 7/6/16.
//  Copyright © 2016 Taphouse Software. All rights reserved.
//

import Foundation
import StoreKit

struct IAPError {
    let message: String
}

protocol IAPManagerDelegate: class {
    func batteryPurchased(battery: Battery)
    func batteryPurchasedFailed(battery: Battery?, withError error: IAPError)
}

class IAPManager: NSObject {
    private weak var delegate: IAPManagerDelegate?
    private var battery: Battery? = nil
    
    //MARK: API
    init(delegate: IAPManagerDelegate?) {
        self.delegate = delegate
        super.init()
        SKPaymentQueue.defaultQueue().addTransactionObserver(self)
    }
    
    func purchase(battery battery: Battery) {
        guard self.battery == nil else {
            let error = IAPError(message: "There is already a battery being purchased.")
            delegate?.batteryPurchasedFailed(battery, withError: error)
            return
        }
        
        self.battery = battery
        
        let identifierSet: Set<String> = [battery.sku]
        let request = SKProductsRequest(productIdentifiers: identifierSet)
        request.delegate = self
        request.start()
        
    }
}

extension IAPManager: SKProductsRequestDelegate {
    func productsRequest(request: SKProductsRequest, didReceiveResponse response: SKProductsResponse) {
        let _product = response.products.filter { product in
            return product.productIdentifier == self.battery?.sku
    }.first
        
        guard let product = _product else {
            let error = IAPError(message: "Product ID not found")
            delegate?.batteryPurchasedFailed(battery, withError: error)
            battery = nil
            return
        }
        
        let payment = SKPayment(product: product)
        SKPaymentQueue.defaultQueue().addPayment(payment)
   }

}

extension IAPManager : SKPaymentTransactionObserver {
    func paymentQueue(queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
        guard let battery = battery else { return }
            for transaction in transactions {
                guard transaction.error == nil else {
                    let error = IAPError(message: transaction.error!.localizedDescription)
                    delegate?.batteryPurchasedFailed(battery, withError: error)
                    continue
                }
                
                switch transaction.transactionState {
                case .Purchased:
                    delegate?.batteryPurchased(battery)
                    SKPaymentQueue.defaultQueue().finishTransaction(transaction)
                case .Failed:
                    let error = IAPError(message: "Transaction failed")
                    delegate?.batteryPurchasedFailed(battery, withError: error)
                default:
                    break
                }
            }
        }
    }

