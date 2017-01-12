//
//  Bars.swift
//  Buzzed
//
//  Created by Alan Guerrero on 10/21/15.
//  Copyright © 2015 CS378. All rights reserved.
//

import Foundation
import UIKit

class Bars{
    fileprivate var _name:String = ""
    fileprivate var _image:UIImage
    fileprivate var _long:Double = 0.0
    fileprivate var _lat:Double = 0.0
    fileprivate var _barID:Int = 0
    fileprivate var _distance:Float = 0
    fileprivate var _deals:[Deals] = [Deals]()
    
    var name:String{
        get{
            return _name
        }
        set(newValue){
            _name = newValue
        }
    }
    var image:UIImage{
        get{
            return _image
        }
        set(newValue){
            _image = newValue
        }
    }
    var lat:Double{
        get{
            return _lat
        }
        set(newValue){
            _lat = newValue
        }
    }
    var long:Double{
        get{
            return _long
        }
        set(newValue){
            _long = newValue
        }
    }
    var barID:Int{
        get{
            return _barID
        }
        set(newValue){
            _barID = newValue
        }
    }
    var distance:Float{
        get{
            return _distance
        }
        set(newValue){
            _distance = newValue
        }
    }
    var deals:[Deals]{
        get{
            return _deals
        }
        set(newValue){
            _deals = newValue
        }
    }
    
    init(name:String, image:UIImage, lat:Double, long:Double, barID:Int, distance:Float){
        _name = name
        _image = image
        _lat = lat
        _long = long
        _barID = barID
        _distance = distance
    }
    
    func getDealCount()-> Int{
        return _deals.count
    }
    
    func getDeal(_ index:Int)->Deals{
        if(index<_deals.count){
            return _deals[index]
        }
        else
        {
            return Deals(name: "no Deal", price:0, barID:0)
        }
    }

}
