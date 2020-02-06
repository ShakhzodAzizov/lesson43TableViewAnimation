//
//  ViewController.swift
//  lesson43TableViewAnimation
//
//  Created by Shakhzodbek on 2/6/20.
//  Copyright © 2020 Shakhzodbek Azizov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        
        print("hello")
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? TVC else{
            return UITableViewCell()
        }
        
    cell.view.backgroundColor = .red
        
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        200
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        
//        UIView.animate(withDuration: 0.5, delay: 0.1, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .transitionFlipFromTop, animations: {
//            cell.transform = .identity
//        }, completion: nil)
//
        let redView = cell.viewWithTag(3)!
//        UIView.transition(with: redView, duration: 0.3, options: .transitionFlipFromBottom, animations: {
//
//        }, completion: nil)
        
        UIView.animate(withDuration: 0.5) {
            redView.transform = CGAffineTransform(translationX: -50, y: 0)
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        cell?.viewWithTag(3)!.backgroundColor = .green
    }
}
