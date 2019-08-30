//
//  Tweet.swift
//  TwitterAPIAPP
//
//  Created by Yushi Nakaya on 2019/08/20.
//  Copyright © 2019 Yushi Nakaya. All rights reserved.
//

import Foundation

struct Tweet {
    
    // Tweetのid
    let id: String
    
    // Tweetの本文
    let text: String
    
    // このTweetの主
    let user: User
    
}
