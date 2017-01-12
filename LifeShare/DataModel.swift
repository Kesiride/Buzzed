//
//  DataModel.swift
//  Buzzed
//
//  Created by Alan Guerrero on 10/21/15.
//  Copyright © 2015 CS378. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class DataModel{
    //    var deals = [NSManagedObject]()
    var deals:[Deals] = [Deals]()
    var establishments:[Bars] = [Bars]()
    
    func getCount()-> Int{
        return establishments.count
    }
    
    func getDealCount()-> Int{
        return deals.count
    }
    func getDealCountBarID(_ barID:Int)-> Int{
        var count = 0
        for d in deals{
            if(barID == d.barID){
                count += 1
            }
        }
        return count
    }
    
    init(){
        var b = Bars(name: "Cain and Abel's", image: UIImage(named:"abels.jpg")!, lat: 30.2877516, long: -97.7444997, barID: 6, distance: 0.3)
        b.deals.append(Deals(name: "Beers", price: 1, day: "T"))
        b.deals.append(Deals(name: "Margaritas", price: 2, day: "W"))
        b.deals.append(Deals(name: "Texas Teas", price: 7, day: "Th"))
        b.deals.append(Deals(name: "Texas Pints", price: 3, day: "Th"))
        b.deals.append(Deals(name: "H-Bombs", price: 3.5, day: "F"))
        establishments.append(b)
        
        
        b = Bars(name: "Shakespeare", image: UIImage(named:"shakespear.jpg")!, lat: 30.267388, long: -97.739778, barID: 1, distance: 1.1)
        b.deals.append(Deals(name: "Vodka", price: 2, day: "M"))
        b.deals.append(Deals(name: "Tequila", price: 4, day: "T"))
        b.deals.append(Deals(name: "Beer", price: 1, barID: 2))
        b.deals.append(Deals(name: "Pitcher", price: 5, barID: 3))
        establishments.append(b)
        
        b = Bars(name: "The Blind Pig", image: UIImage(named:"blindpig.jpg")!, lat: 30.266938, long: -97.739870, barID: 2, distance: 1.8)
        b.deals.append(Deals(name: "Vodka", price: 2, barID: 3))
        b.deals.append(Deals(name: "Tequila", price: 4, barID: 1))
        b.deals.append(Deals(name: "Beer", price: 1, barID: 1))
        b.deals.append(Deals(name: "Pitcher", price: 5, barID: 3))
        b.deals.append(Deals(name: "Margarita", price: 3.50, barID: 2))
        b.deals.append(Deals(name: "Domestics", price: 2, barID: 3))
        b.deals.append(Deals(name: "You Call It", price: 3.50, barID: 1))
        establishments.append(b)
        
        b = Bars(name: "Barbarella", image: UIImage(named:"barbarella.jpg")!, lat: 30.267126, long: -97.736584, barID: 3, distance: 2.2)
        b.deals.append(Deals(name: "Rails", price: 3, barID: 3))
        b.deals.append(Deals(name: "Top Shelf", price: 5, barID: 2))
        b.deals.append(Deals(name: "Tacos", price: 2, barID: 1))
        b.deals.append(Deals(name: "Shots", price: 3.50, barID: 1))
        b.deals.append(Deals(name: "Bottle Service", price: 30, barID: 3))
        establishments.append(b)
        
        b = Bars(name: "Buckshots", image: UIImage(named:"buckshot.jpg")!, lat: 30.2670561, long: -97.73836140000003, barID: 4, distance: 2.3)
        b.deals.append(Deals(name: "Beer", price: 1, barID: 2))
        b.deals.append(Deals(name: "Pitcher", price: 5, barID: 3))
        b.deals.append(Deals(name: "Margarita", price: 3.50, barID: 3))
        b.deals.append(Deals(name: "Vodka", price: 2, barID: 3))
        b.deals.append(Deals(name: "Tequila", price: 4, barID: 1))
        establishments.append(b)
        
        b = Bars(name: "The Aquarium", image: UIImage(named:"aquarium.jpg")!, lat: 30.266767, long: -97.73918300000003, barID: 5, distance: 2.5)
        b.deals.append(Deals(name: "Pitcher", price: 5, barID: 3))
        b.deals.append(Deals(name: "Margarita", price: 3.50, barID: 3))
        b.deals.append(Deals(name: "Vodka", price: 2, barID: 3))
        b.deals.append(Deals(name: "Tequila", price: 4, barID: 1))
        establishments.append(b)
        


        //establishments.append(Bars(name: "The Aquarium", image: UIImage(named:"aquarium.jpg")!, lat: 30.266767, long: -97.73918300000003, barID: 5, distance: 2.5))

        //30.2670561
        
        //establishments.deals.append(Deals(name: "Vodka", price: 2)
        

        
        
    }
    
    func getBar(_ index:Int)->Bars{
        if(index<establishments.count){
            return establishments[index]
        }
        else
        {
            return Bars(name: "no Bar", image:UIImage(named: "")!, lat:0.0, long:0.0, barID:0, distance: 0)
        }
    }
    
    func getBarFromName(_ name:String)->Bars{
        var index = 0
        while(index<establishments.count){
            if(establishments[index].name == name){
                return establishments[index]
            }
            index += 1
        }
        return Bars(name: "no Bar", image:UIImage(named: "")!, lat:0.0, long:0.0, barID:0, distance: 0)
    }
    
    func addDeal(_ name:String, price:Float, barID:Int){
        deals.append(Deals(name: name, price: price, barID: barID))
    }
    
    func getDeal(_ index:Int)->Deals{
        if(index<deals.count){
            return deals[index]
        }
        else
        {
            return Deals(name: "no Deal", price:0, barID:0)
        }
    }
    func getDealFromName(_ name:String)->Deals{
        var index = 0
        while(index<deals.count){
            if(deals[index].name == name){
                return deals[index]
            }
            index += 1
        }
        return Deals(name: "no Deal", price:0, barID:0)
    }
    
    func getDealBarID(_ index:Int, barID:Int)->Deals{
        if(index<deals.count && deals[index].barID == barID){
            return deals[index]
        }
        else
        {
            return Deals(name: "no Deal", price:0, barID:0)
        }
    }
    func getNextDealBarID(_ barDealCount:Int, barID:Int)->Deals{
        var numDeal = 0
        for d in deals{
            if(barID == d.barID && numDeal == barDealCount){
                return d
            }
            else if(barID == d.barID){
                numDeal += 1
            }
        }
        return Deals(name: "no Deal", price:0, barID:0)
    }
}
