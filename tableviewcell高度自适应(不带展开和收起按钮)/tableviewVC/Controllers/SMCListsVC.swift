//
//  SMCListsVC.swift
//  FullNetProficient
//
//  Created by admin on 2018/7/10.
//  Copyright © 2018年 admin. All rights reserved.
//

import UIKit

class SMCListsVC: UIViewController {
    
    let appWidth = UIScreen.main.bounds.size.width
    let appHeight = UIScreen.main.bounds.size.height
    
    fileprivate var dataStr = [String]()
    fileprivate var heightArray = [CGFloat]()
    // 选择标识
    fileprivate var flags = [Bool]()
    
    fileprivate lazy var tableView: UITableView = {
        let table = UITableView.init(frame: CGRect(x: 0, y: 20, width: appWidth, height: appHeight - 20), style: .grouped)
        table.dataSource = self
        table.delegate = self
        table.backgroundColor = UIColor.white
        table.register(UINib.init(nibName: "SMCListsCell", bundle: nil), forCellReuseIdentifier: SMCListsCell.identifier)
        table.separatorStyle = .none
        table.showsVerticalScrollIndicator = false
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        myData()
        
    }
    
    func debugLog<T>(emoji: String? = "😁", _ object: T) {
        #if DEBUG
        print(emoji! + " " + String(describing: object))
        #endif
    }
    
    //生成假数据
    fileprivate func myData(){
        let testStr:NSMutableString = "Siri 让你能够利用语音来完成发送信息、安排会议、查看最新比分等更多事务。只要说出你想做的事，Siri 就能帮你办到。Siri 可以听懂你说的话、知晓你的心意，甚至还能有所回应。iOS 7 中的 Siri 拥有新外观、新声音和新功能。它的界面经过重新设计，以淡入视图浮现于任意屏幕画面的最上层。Siri 回答问题的速度更快，还能查询更多信息源，如维基百科。它可以承担更多任务，如回电话、播放语音邮件、调节屏幕亮度，以及更多。"
        debugLog("testStr.length===\(testStr.length)")
//        (0 ..< 5).forEach { _ in
//            let index = (arc4random().hashValue%(testStr.length / 20)) * 20
//            let str = testStr.substring(to: index)
//            debugLog("str===\(str)")
//            debugLog("index===\(index)")
//        }
        dataStr.append(testStr.substring(to: 100))
        dataStr.append(testStr.substring(to: 50))
        dataStr.append(testStr.substring(to: 200))
        dataStr.append(testStr.substring(to: 120))
        dataStr.append(testStr.substring(to: 10))
        debugLog("dataStr===\(dataStr)")
        
        tableView.reloadData()
    }
    
    
    fileprivate func configureUI() {
        view.backgroundColor = UIColor.white
        view.addSubview(tableView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension SMCListsVC: UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataStr.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        debugLog("111")
        //高度自适应
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SMCListsCell.identifier) as! SMCListsCell
        cell.selectionStyle = .none
        cell.contentLabel.text = dataStr[indexPath.item]
        debugLog("222")
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return nil
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return nil
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        debugLog("\(indexPath.item)")
    }
}





