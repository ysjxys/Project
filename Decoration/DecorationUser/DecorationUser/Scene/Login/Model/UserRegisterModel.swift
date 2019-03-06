//
//  UserRegisterModel.swift
//  DecorationUser
//
//  Created by ysj on 2017/12/6.
//  Copyright © 2017年 ysj. All rights reserved.
//

import Foundation
import HandyJSON

struct UserRegisterModel: YSJModeling {
    
    //用户id
    var id: String?
    
    //电话
    var mobile: String?
    
    //姓名
    var name: String?
    
    //昵称
    var nickname: String?
    
    //积分
    var integral: String?
    
    //余额
    var gold: Double?
    
    //邀请码
    var invitationCode: String?
    
    //锁定状态（false为未锁定）
    var locked: Bool?
}
