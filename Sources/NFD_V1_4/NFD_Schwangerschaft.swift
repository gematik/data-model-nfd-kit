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
public class NFD_Schwangerschaft {
    
    public static let namespacePrefix: String? = "NFD"
    public static let namespaceUri: String? = "http://ws.gematik.de/fa/nfds/NFD_Document/v1.4"
    
    // attributes:
    
    // elements:
    public var Entbindungstermin_Errechnet: String?
    public var Schwangerschaft: String
    public var diagnostiziert_indiziert: NFD_Diagnose_Indikation?
    
    // default Constructor
    public init() {
        
        self.Entbindungstermin_Errechnet = nil
        self.Schwangerschaft = String()
        self.diagnostiziert_indiziert = nil
        
    }
    
    // copy Constructor
    public init(_ _NFD_Schwangerschaft: NFD_Schwangerschaft ) {
        
        self.Entbindungstermin_Errechnet = _NFD_Schwangerschaft.Entbindungstermin_Errechnet
        self.Schwangerschaft = _NFD_Schwangerschaft.Schwangerschaft
        self.diagnostiziert_indiziert = _NFD_Schwangerschaft.diagnostiziert_indiziert
        
    }
    
    public class func deserialize(_ infoset: Infoset) -> NFD_Schwangerschaft {
        
        let _NFD_Schwangerschaft = NFD_Schwangerschaft()
        
        let uriEntbindungstermin_Errechnet = String.namespaceUri ?? self.namespaceUri ?? infoset.namespaceContext.defaultURI!
        let qNameEntbindungstermin_Errechnet = QName("Entbindungstermin_Errechnet", uri: uriEntbindungstermin_Errechnet)
        _NFD_Schwangerschaft.Entbindungstermin_Errechnet = String?.deserialize(infoset.select(qNameEntbindungstermin_Errechnet))
        
        let uriSchwangerschaft = String.namespaceUri ?? self.namespaceUri ?? infoset.namespaceContext.defaultURI!
        let qNameSchwangerschaft = QName("Schwangerschaft", uri: uriSchwangerschaft)
        _NFD_Schwangerschaft.Schwangerschaft = String.deserialize(infoset.select(qNameSchwangerschaft))
        
        let uridiagnostiziert_indiziert = NFD_Diagnose_Indikation.namespaceUri ?? self.namespaceUri ?? infoset.namespaceContext.defaultURI!
        let qNamediagnostiziert_indiziert = QName("diagnostiziert_indiziert", uri: uridiagnostiziert_indiziert)
        _NFD_Schwangerschaft.diagnostiziert_indiziert = NFD_Diagnose_Indikation?.deserialize(infoset.select(qNamediagnostiziert_indiziert))
        
        return _NFD_Schwangerschaft
    }
}

extension Optional where Wrapped == NFD_Schwangerschaft {
    public static func deserialize(_ infoset: Infoset) -> NFD_Schwangerschaft? {
        if infoset.count == 0 {
            return nil
        } else {
            return NFD_Schwangerschaft.deserialize(infoset)
        }
    }
}

extension Array where Element: NFD_Schwangerschaft {
    public var namespaceUri: String? {
        get {
            return NFD_Schwangerschaft.namespaceUri
        }
    }
    
    public static func deserialize(_ infoset: Infoset) -> [NFD_Schwangerschaft] {
        return infoset.map { (element: Infoset) in
        NFD_Schwangerschaft.deserialize(element)
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

