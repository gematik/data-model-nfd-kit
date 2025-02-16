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

import Foundation
import XMLTools

public class DS_SignaturePlaceholder {
    public static let namespacePrefix: String? = "DS"
    public static let namespaceUri: String? = "http://www.w3.org/2000/09/xmldsig#"
    
    public class func deserialize(_ infoset: Infoset) -> DS_SignaturePlaceholder {
        return DS_SignaturePlaceholder()
    }
}

extension Optional where Wrapped == DS_SignaturePlaceholder {
    public static func deserialize(_ infoset: Infoset) -> DS_SignaturePlaceholder? {
        if infoset.count == 0 {
            return nil
        } else {
            return DS_SignaturePlaceholder.deserialize(infoset)
        }
    }
}

