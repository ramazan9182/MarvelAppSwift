//
//  CharacterDetailVC.swift
//  MarvelAPISwift
//
//  Created by Ramazan Ceylan on 16.01.2022.
//

import UIKit
import ObjectMapper
import Kingfisher
import SpringIndicator

class CharacterDetailVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var stringFormatURL: String?
    var data = [CharacterCoomicsModel]()
    var id: Int?
    override var preferredStatusBarStyle: UIStatusBarStyle {
            return .lightContent
        }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .black
        self.getService()
    }
        
        func getService() {
            let indicator = SpringIndicator(frame: CGRect(x: 100, y: 100, width: 60, height: 60))
                    view.addSubview(indicator)
                    indicator.center = self.view.center
                    indicator.start()
            
            MarvelNetwork.makeRequest(target: .marvelComm(charId: String(id!),apiKey: API_KEY, timeStamp: TIME_STAMP, hashKey: HASH_KEY), success: { (JSON) in
                    if let data = Mapper<CharacterCoomicsModel>().mapArray(JSONObject: JSON["data"]["results"].arrayObject) {
                        self.data = data
                        self.tableView.reloadData()
                        indicator.stop()
                    }
                        }, statusCode: { (statusCode, statusMessage, requestForm) in
                            print(statusCode)
                            indicator.stop()
                        }, failure: { (moyaError) in
                            print(moyaError)
                })
        }
}

extension CharacterDetailVC : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "characterDetailCell" , for: indexPath) as! CharacterDetailViewCell
        cell.lblCharComTitle.text = self.data[indexPath.row].title
        cell.lblCharaterDetail.text = self.data[indexPath.row].description
        cell.lblCharaterDetail.sizeToFit()
        let formatImage = "\(self.data[indexPath.row].commicsImagePath!).\(self.data[indexPath.row].commicsImageExt!)"
        cell.imgCommics.kf.setImage(with: URL(string: formatImage))
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}

