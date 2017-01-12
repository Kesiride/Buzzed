//
//  Deals.swift
//  Buzzed
//
//  Created by Alan Guerrero on 10/21/15.
//  Copyright © 2015 CS378. All rights reserved.
//

import Foundation
import UIKit

class Deals{
    fileprivate var _name:String = ""
    fileprivate var _price:Float = 0
    fileprivate var _upvotes:Float = 0
    fileprivate var _downvotes:Float = 0
    fileprivate var _barID:Int = 0
    fileprivate var _day:String = ""
    
    var name:String{
        get{
            return _name
        }
        set(newValue){
            _name = newValue
        }
    }
    
    var price:Float{
        get{
            return _price
        }
        set(newValue){
            _price = newValue
        }
    }
    
    var upvotes:Float{
        get{
            return _upvotes
        }
        set(newValue){
            _upvotes = newValue
        }
    }
    var downvotes:Float{
        get{
            return _downvotes
        }
        set(newValue){
            _downvotes = newValue
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
    
    var day:String{
        get{
            return _day
        }
        set(newValue){
            _day = newValue
        }
    }
    
    func percentageOfLikes()->Int{
        let ratings : Float = _upvotes + _downvotes
        let likes =  _upvotes/ratings
        let likePercentage = likes * 100
        return Int(likePercentage)
    }
    
    init(name:String, price:Float, barID:Int){
        _name = name
        _price = price
        _upvotes = 1
        _downvotes = 0
        _barID = barID
    }
    
    init(name:String, price:Float, day:String){
        _name = name
        _price = price
        _upvotes = 1
        _downvotes = 0
        _barID = 0
        _day = day
    }
}
