//
//  CharacterController.swift
//  MarvelAPISwift
//
//  Created by Ramazan Ceylan on 16.01.2022.
//

import UIKit
import ObjectMapper
import Kingfisher
import SpringIndicator

public let API_KEY = "834ec44d432bfdec1d32b9697c19aa9a"
public let TIME_STAMP = "1"
public let HASH_KEY = "4dc4a8e6b6cdc1565e63603351203834"
public let LIMIT = "100"

class CharacterVC: UIViewController {
    
    var data = [CharacterModel]()
    var selectedIndex : Int?
    var formatImage: String?
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .black
        
        navigationController?.navigationBar.barTintColor = UIColor.black
        self.getService()
    }
    
    func getService() {
        let indicator = SpringIndicator(frame: CGRect(x: 100, y: 100, width: 60, height: 60))
                view.addSubview(indicator)
                indicator.center = self.view.center
                indicator.start()
        
        MarvelNetwork.makeRequest(target: .marvelChar(apiKey: API_KEY, timeStamp: TIME_STAMP, hashKey: HASH_KEY), success: { (JSON) in
                if let data = Mapper<CharacterModel>().mapArray(JSONObject: JSON["data"]["results"].arrayObject) {
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

extension CharacterVC : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "characterCell" , for: indexPath) as! CharacterTableViewCell
        cell.lblCharacterName.text = self.data[indexPath.row].name
        self.formatImage = "\(self.data[indexPath.row].characterImagePath!).\(self.data[indexPath.row].characterImageExt!)"
        cell.imgCharacter.kf.setImage(with: URL(string: formatImage!))
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedIndex = indexPath.row
        self.performSegue(withIdentifier: "characterDetailVC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let characterDetailVC = segue.destination as! CharacterDetailVC
        characterDetailVC.id = data[selectedIndex!].id
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}
