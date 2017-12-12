//
//  Scene.swift
//  MonmouthEduAPP
//
//  Created by LiangLyu on 11/7/16.
//  Copyright © 2016 Monmouth University. All rights reserved.
//

import Foundation
import MapKit

class Scene: NSObject,MKAnnotation{
    let titlename: String
    let location: String
    let discipline: String
    let coordinate: CLLocationCoordinate2D
    init(titlename: String, location: String, discipline: String, coordinate: CLLocationCoordinate2D) {
        self.titlename = titlename
        self.location = location
        self.discipline = discipline
        self.coordinate = coordinate
        
        super.init()
    }
    var title: String?{
        return titlename
    }
    var subtitle: String?{
        return location
    }
}