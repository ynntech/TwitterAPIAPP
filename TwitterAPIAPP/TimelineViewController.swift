//
//  TimelineViewController.swift
//  TwitterAPIAPP
//
//  Created by Yushi Nakaya on 2019/08/20.
//  Copyright © 2019 Yushi Nakaya. All rights reserved.
//

import UIKit

class TimelineViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
   
    var tweets:[Tweet] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        // ダミーデータの生成
        let user = User(id: "1", screenName: "ynntech", name: "nakaya", profileImageURL: "https://pbs.twimg.com/profile_images/786584678660616196/43jmIqIR.jpg")
        let tweet = Tweet(id: "01", text: "てすとついーと", user: user)
        
        let tweets = [tweet]
        self.tweets = tweets
        
        
       
        // tableViewのリロード
        tableView.reloadData()
 
        tableView.delegate = self
        tableView.dataSource = self
        
        
        /*
         //あとからたしたやつ
        LoginCommunicator().login() { isSuccess in
            switch isSuccess {
            case false:
                print("ログイン失敗")
            case true:
                print("ログイン成功")
            }
        }
 */
        
        

    }
}

// UITableViewDelegate
extension TimelineViewController: UITableViewDelegate {
    // cellがタップされたのを検知したときに実行する処理
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("セルがタップされたよ！")
    }
    
    // セルの見積もりの高さを指定する処理
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    // セルの高さ指定をする処理
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        // UITableViewCellの高さを自動で取得する値
        return UITableView.automaticDimension
    }
}

 // UITableViewDataSource

extension TimelineViewController: UITableViewDataSource {
    //何個のcellを生成するかを設定する関数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //tweetsの配列内の要素数分を指定
        return tweets.count
    }
    
    //描画するcellを指定する関数
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //TweetTableViewCellを表示したいので、TweetTableViewCellを取得
        let cell = tableView.dequeueReusableCell(withIdentifier: "TweetTableViewCell") as! TweetTableViewCell
        //Storyboardからセルをとってきて、TweetTableViewCellとしてキャストしている(関数の戻り値はUITableViewCellなので)
        

        // TweetTableViewCellの描画内容となるtweetを渡す
        cell.fill(tweet: tweets[indexPath.row])
        
        return cell
    }
}
