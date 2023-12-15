//
//  ViewController.swift
//  FirstApp
//
//  Created by Vinay on 15/12/23.
//
// AGenda ---> Call Api show mail in FirstVc and tap on email show details on seocndVc based on indexpath

import UIKit

class ViewController: UIViewController {
    
    var apiResult = [WelcomeElement]()
    @IBOutlet weak var tableView: UITableView!
    
    func registerCell() {
        let nib = UINib(nibName: "MainTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "MainTableViewCell")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
        fetchDetails()
    }
    
    func fetchDetails(){
        APIHandler.shared.callAPI { re in
            switch re {
            case .success(let welcome):
                DispatchQueue.main.async {
                    self.apiResult = welcome
                    self.tableView.reloadData()
                }
            case .failure(_):
                print(".")
            }
        }
    }
}

extension ViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return apiResult.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "MainTableViewCell", for: indexPath) as? MainTableViewCell {
            cell.la.text = apiResult[indexPath.row].email
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("e")
        let vc = UIStoryboard(name: "SecondViewViewController", bundle: Bundle.main).instantiateViewController(withIdentifier: "SecondViewViewController") as? SecondViewViewController
        vc?.result = apiResult[indexPath.row]
        self.navigationController?.pushViewController(vc!, animated: true)
    }
}
