//
//  PointsModel.swift
//  MonmouthEduAPP
//
//  Created by LiangLyu on 10/22/16.
//  Copyright © 2016 Monmouth University. All rights reserved.
//

import Foundation
class PointsModel{

    var attraction_points = [Dictionary<String,AnyObject>]()
    
    init(){
        readJsonFile()
    }
    
    func readJsonFile(){
        if let path = NSBundle.mainBundle().pathForResource("AttractionPoints", ofType: "json"){
            do{
                let jsonData = try NSData(contentsOfFile: path, options: NSDataReadingOptions.DataReadingMappedIfSafe)
                do{
                    let jsonResult : NSDictionary = try
                        NSJSONSerialization.JSONObjectWithData(jsonData, options: NSJSONReadingOptions.MutableContainers) as! NSDictionary
                    if let sets : [Dictionary<String, AnyObject>] = jsonResult["attractions"] as? [Dictionary]
                    {
                        attraction_points = sets
                    }
                }catch{}
            }catch{}
        }
    }
}