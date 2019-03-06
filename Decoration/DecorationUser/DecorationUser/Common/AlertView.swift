//
//  AlertView.swift
//  DecorationUser
//
//  Created by ysj on 2017/12/7.
//  Copyright © 2017年 ysj. All rights reserved.
//

import Foundation

func showAlertUnKnowError() {
    PromptView.show(title: "未知错误", type: .error)
}

func showAlertDataAnalysisError() {
    PromptView.show(title: "数据解析错误", type: .error)
}

func showAlertSystemBusy() {
    PromptView.show(title: "系统繁忙，稍后再试试", type: .error)
}

func showAlertNetError() {
    PromptView.show(title: "网络异常，请检查一下", type: .error)
}
