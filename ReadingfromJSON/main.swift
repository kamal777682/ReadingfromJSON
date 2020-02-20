//
//  main.swift
//  ReadingfromJSON
//
//  Created by MacStudent on 2020-02-19.
//  Copyright © 2020 MacStudent. All rights reserved.
//

import Foundation

func readTextFile(fileName : String)
{
    print(Bundle.main.bundlePath)
    if let path =  Bundle.main.path(forResource: fileName, ofType: "txt") // give path
    {
        print(path)
        let str = try! String(contentsOfFile: path) // to read the contents
        print(str)
    }
}

//readTextFile(fileName: "data")

func readJSONUerInfo(fileName : String)
{
    let filePath =  Bundle.main.url(forResource: fileName, withExtension: "json") // give path
    guard let path = filePath else
    {
    
        print("Invalid File Found")
        return
    }
    guard  let data = try? Data(contentsOf: path) else
    {
        print("Error while read Data From URL")
        return
    }
    
    guard let json = try? JSONSerialization.jsonObject(with: data, options: []) else
    {
        print("Error while reading json file")
        return
    }
    //print(json)
    
    if let userDictionary  = json as?  [String: Any]
    {
        //print(userDictionary)
        let id = userDictionary["id"] ?? "No ID Found"
        print(id)
        if let address = userDictionary["address"] as? [String : Any]
        {
            print(address["city"]!)
        }
        if let company = userDictionary["company"] as? [String : Any]
        {
            print(company["name"]!)
        }
    }
    
}

readJSONUerInfo(fileName: "SingleUser")

// any type of information can be read from Data class
// Any type and Any Object Tye
