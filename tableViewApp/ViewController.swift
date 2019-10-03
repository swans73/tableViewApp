//
//  ViewController.swift
//  tableViewApp
//
//  Created by swans on 2019/10/02.
//  Copyright © 2019 swans. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var tableView: UITableView!
    //他の画面からsegueを使って戻ってきたときに呼ばれる
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        //segueから遷移先のResultViewControllerを取得する
        let resultViewController:ResultViewController = segue.destination as! ResultViewController
        //遷移先のResultViewControllerで宣言している値に値を代入して渡す
        let indexPath:NSIndexPath = self.tableView.indexPathForSelectedRow! as NSIndexPath
        resultViewController.x = indexPath.row + 1
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30 // 30個のデータがあるという意味
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //再利用可能なcellを得る
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        //値を設定する
        cell.textLabel!.text = "\(indexPath.row + 1)行目"
        if indexPath.row % 3 == 2 {
            cell.textLabel!.textColor = UIColor.red
        } else {
            cell.textLabel!.textColor = UIColor.black
        }
          return cell
    }


}

