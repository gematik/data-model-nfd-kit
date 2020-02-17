//
//  Copyright (c) 2020 gematik GmbH
//  
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//  
//     http://www.apache.org/licenses/LICENSE-2.0
//  
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//

//
//  This file was generated from an xsd file and represents a simple or complex type of it.
//  Generated by a fork of xsd2cocoa (see https://github.com/Daij-Djan/xsd2cocoa) and a specified custom transform template.
//

import Foundation
import XMLTools

// MARK: - Generated file, do not edit. Any edits of this file will be overwritten and thus discarded.
public class NFD_SignatureArzt {
    
    public static let namespacePrefix: String? = "NFD"
    public static let namespaceUri: String? = "http://ws.gematik.de/fa/nfds/NFD_Document/v1.4"
    
    // attributes:
    
    // elements:
    public var Signature: DS_SignaturePlaceholder?
    
    // default Constructor
    public init() {
        
        self.Signature = nil
        
    }
    
    // copy Constructor
    public init(_ _NFD_SignatureArzt: NFD_SignatureArzt ) {
        
        self.Signature = _NFD_SignatureArzt.Signature
        
    }
    
    public class func deserialize(_ infoset: Infoset) -> NFD_SignatureArzt {
        
        let _NFD_SignatureArzt = NFD_SignatureArzt()
        
        let uriSignature = DS_SignaturePlaceholder.namespaceUri ?? self.namespaceUri ?? infoset.namespaceContext.defaultURI!
        let qNameSignature = QName("Signature", uri: uriSignature)
        _NFD_SignatureArzt.Signature = DS_SignaturePlaceholder?.deserialize(infoset.select(qNameSignature))
        
        return _NFD_SignatureArzt
    }
}

extension Optional where Wrapped == NFD_SignatureArzt {
    public static func deserialize(_ infoset: Infoset) -> NFD_SignatureArzt? {
        if infoset.count == 0 {
            return nil
        } else {
            return NFD_SignatureArzt.deserialize(infoset)
        }
    }
}

extension Array where Element: NFD_SignatureArzt {
    public var namespaceUri: String? {
        get {
            return NFD_SignatureArzt.namespaceUri
        }
    }
    
    public static func deserialize(_ infoset: Infoset) -> [NFD_SignatureArzt] {
        return infoset.map { (element: Infoset) in
        NFD_SignatureArzt.deserialize(element)
    }
}
}

// utility functions
fileprivate extension String {
    static let namespacePrefix: String? = nil
    static let namespaceUri: String? = nil
    
    static func deserialize(_ infoset: Infoset) -> String {
        return infoset.text
    }
}

fileprivate extension Optional where Wrapped == String {
    static func deserialize(_ infoset: Infoset) -> String? {
        if infoset.count == 0 {
            return nil
        } else {
            return String.deserialize(infoset)
        }
    }
}

fileprivate extension Int {
    static let namespacePrefix: String? = nil
    static let namespaceUri: String? = nil
    
    static func deserialize(_ infoset: Infoset) -> Int {
        guard let ret = Int(infoset.text) else {
            return 0
        }
        return ret
    }
}

fileprivate extension Optional where Wrapped == Int {
    static func deserialize(_ infoset: Infoset) -> Int? {
        if infoset.count == 0 {
            return nil
        } else {
            return Int.deserialize(infoset)
        }
    }
}

fileprivate extension Double {
    static let namespacePrefix: String? = nil
    static let namespaceUri: String? = nil
    
    static func deserialize(_ infoset: Infoset) -> Double {
        guard let ret = Double(infoset.text) else {
            return 0
        }
        return ret
    }
}

fileprivate extension Optional where Wrapped == Double {
    static func deserialize(_ infoset: Infoset) -> Double? {
        if infoset.count == 0 {
            return nil
        } else {
            return Double.deserialize(infoset)
        }
    }
}

