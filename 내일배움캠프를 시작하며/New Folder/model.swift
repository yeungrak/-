//
//  model.swift
//  내일배움캠프를 시작하며
//
//  Created by 최영락 on 3/6/25.
//

import Foundation
import UIKit

class Memo {

    
    var content: String
    var insertDate: Date
    var image: UIImage? // 사진 저장을 위한 속성
    
    init(content: String, image: UIImage? = nil) {
        self.content = content
        insertDate = Date()
        self.image = image //기본값 'nil'
    }
    
    static var dummyMemoList = [
        Memo(content: "터치하여 작성", image: UIImage(named: "sample1")),
    ]
}
