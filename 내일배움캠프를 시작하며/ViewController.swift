//
//  ViewController.swift
//  내일배움캠프를 시작하며
//
//  Created by 최영락 on 3/6/25.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource,UITableViewDelegate {
    
    let formatter: DateFormatter = {
        let f = DateFormatter ()
        f.dateStyle = .short
        f.timeStyle = .short
        f.locale = Locale(identifier: "ko_kr")
        return f
    }()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Memo.dummyMemoList.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 170
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let spacerView = UIView()
        spacerView.backgroundColor = .clear
        return spacerView
        
        func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
            let footerView = UIView()
            footerView.backgroundColor = .clear
            return footerView
        }
        
        
        func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
            return 20
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 2 // 셀 간격
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MemoCell", for: indexPath)
        let memo = Memo.dummyMemoList[indexPath.row]
        let formattedDate = formatter.string(from: memo.insertDate)

        cell.textLabel?.text = memo.content
        cell.detailTextLabel?.text = formattedDate
        cell.textLabel?.numberOfLines = 2

        if let image = memo.image {
            cell.imageView?.image = image
            cell.imageView?.contentMode = .scaleAspectFill
            cell.imageView?.clipsToBounds = true  //
        } else {
            cell.imageView?.image = UIImage(systemName: "photo")
        }

        cell.layoutSubviews()
        cell.imageView?.frame = CGRect(x: 10, y: 10, width: 80, height: 80)  //이미지 크기

        let cardView = UIView(frame: CGRect(x: 15, y: 10, width: tableView.frame.width - 30, height: 140))
        cardView.backgroundColor = .white
        cardView.layer.cornerRadius = 12

        //테두리
        cardView.layer.borderWidth = 0.5
        cardView.layer.borderColor = UIColor.lightGray.cgColor

        //  그림자
        cardView.layer.shadowColor = UIColor.lightGray.cgColor
        cardView.layer.shadowRadius = 6
        cardView.layer.shadowOpacity = 0.1
        cardView.layer.shadowOffset = CGSize(width: 0, height: 2)

        cell.backgroundView = cardView
        cell.backgroundColor = .clear

        return cell
    }
    
    
    
    @IBOutlet weak var minilable: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.separatorStyle = .none
        tableView.backgroundColor = UIColor.white
        tableView.contentInset = UIEdgeInsets(top: 20, left: 0, bottom: 20, right: 0)
        tableView.sectionFooterHeight = 20
        
        NotificationCenter.default.addObserver(self, selector: #selector(didReceiveNewMemoNotification), name: newmemo.newMemoDisInsert, object: nil)
    }
    @objc func didReceiveNewMemoNotification(_ notification: Notification) {
        tableView.reloadData()
        //test
    }
    
}

