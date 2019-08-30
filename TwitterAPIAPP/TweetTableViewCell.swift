//
//  TweetTableViewCell.swift
//  TwitterAPIAPP
//
//  Created by Yushi Nakaya on 2019/08/20.
//  Copyright © 2019 Yushi Nakaya. All rights reserved.
//

// TweetTableViewCell.swift

import UIKit

class TweetTableViewCell: UITableViewCell {
    // アイコンを表示するUIImageView
    @IBOutlet weak var iconImageView: UIImageView!
    // 名前を表示するUILabel
    @IBOutlet weak var nameLabel: UILabel!
    // スクリーンネーム(@ktanaka117)を表示するUILabel

    @IBOutlet weak var screenNameLabel: UILabel!
    // ツイート本文を表示するUILabel
    
    @IBOutlet weak var textContentLabel: UILabel!

    //TweetTableViewCellに、渡されたTweetの値をUIに反映させる関数
    func fill(tweet: Tweet){
        //profileImageURLから画像をダウンロードしてくる処理
        let downloadTask = URLSession.shared.dataTask(with: URL(string: tweet.user.profileImageURL)!) {
            [weak self] data, response, error in
            if let error = error{
                print(error)
                return
            }
            
            DispatchQueue.main.async {
                self?.iconImageView.image = UIImage(data: data!)
            }
        }
        downloadTask.resume()
        
        
        //tweetから値を取り出して、UIにセットする
        nameLabel.text = tweet.user.name
        textContentLabel.text = tweet.text
        
        // screenNameには"@"が含まれていないので、頭に@をいれて表示させる。
        screenNameLabel.text = "@" + tweet.user.screenName
    }
}
