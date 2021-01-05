//
//  OrderListViewController.swift
//  Countries
//
//  Created by Ebubekir Sezer on 31.12.2020.
//

import UIKit

class OrderListViewController: UIViewController {
    
    
    @IBOutlet weak var orderListTableView: UITableView!
    @IBOutlet var fullView: UIView!
    
    let orderTypes: [Order] = OrderSource.orderLists
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        orderListTableView.dataSource = self
        orderListTableView.delegate = self
        registerCellToTableView()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch: UITouch? = touches.first
        if touch?.view != orderListTableView {
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    func registerCellToTableView(){
        let orderCell = UINib(nibName: "OrderCell", bundle: nil)
        orderListTableView.register(orderCell, forCellReuseIdentifier: "OrderCell")
        
        let headerCell = UINib(nibName: "HeaderCell", bundle: nil)
        orderListTableView.register(headerCell, forCellReuseIdentifier: "HeaderCell")
    }
}


extension OrderListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orderTypes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        
        if let orderCell = tableView.dequeueReusableCell(withIdentifier: "OrderCell", for: indexPath) as? OrderCell {
            let order = orderTypes[indexPath.row]
            orderCell.configure(order: order)
            cell = orderCell
        }
        
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var order = orderTypes[indexPath.row]
        order.isSelected = !order.isSelected
        let cell = tableView.cellForRow(at: indexPath) as! OrderCell
        if let radioButtonView = cell.radioButtonView {
            radioButtonView.onRadioButtonTap(radioButtonView.radioButton)
            orderProductList(by: order)
            //Use closure instead notification center
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerCell = tableView.dequeueReusableCell(withIdentifier: "HeaderCell") as! HeaderCell
        headerCell.configure(title: "Sırala")
        return headerCell.contentView
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 48
    }
    
    func orderProductList(by order: Order){
        let originalProductList = ProductSource.products
        switch order.orderKind {
        case .AtoZ:
            ProductSource.products = ProductSource.products.sorted(by: { $0.productName < $1.productName})
            NotificationCenter.default.post(name: .updateProductList, object: nil)
        case .ZtoA:
            ProductSource.products = ProductSource.products.sorted(by: { $0.productName > $1.productName})
            NotificationCenter.default.post(name: .updateProductList, object: nil)
        case .Original:
            ProductSource.products = originalProductList
            NotificationCenter.default.post(name: .updateProductList, object: nil)
        }
    }
}
