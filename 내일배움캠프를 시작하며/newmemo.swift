//
//  newmemo.swift
//  내일배움캠프를 시작하며
//
//  Created by 최영락 on 3/6/25.
//

import UIKit

class newmemo: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
    @IBOutlet weak var newmemotype: UITextView!
    @IBOutlet weak var newmemotitle: UITextField!
    @IBOutlet weak var memoImageVIEW: UIImageView! //이미지 추가 ui
    
    var selectedImage: UIImage?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //사진 선택 버튼
    @IBAction func selectIamge(_ sender: UIButton) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary //사진 라이브러리에서 선택
        present(picker, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.originalImage] as? UIImage {
            memoImageVIEW.image = image //ui업데이트
            selectedImage = image   // 선택한 이미지 저장
        }
        picker.dismiss(animated: true)
    }
    
    @IBAction func save(_ sender: UIButton){
        guard let text = newmemotitle.text, !text.isEmpty else { return }
        
        let newMemo = Memo(content: text, image: selectedImage) //이미지 포함
        Memo.dummyMemoList.append(newMemo)//리스트에 추가
        
        navigationController?.popViewController(animated: true)
        
        NotificationCenter.default.post(name: newmemo.newMemoDisInsert, object: nil)
        
    }
    }
extension newmemo {
    static let newMemoDisInsert = Notification.Name(rawValue: "newMemoDidInsert")
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        //card style
    }
    }

ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ
