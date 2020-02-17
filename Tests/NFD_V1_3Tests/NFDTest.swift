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
@testable import NFD_V1_3
import Nimble
import XCTest
import XMLTools

final class NFDTest: XCTestCase {

    func testXmlToStructDeserialize() {

        let file = "nfd_v1_3.xml"
        let parser = XMLTools.Parser()
        parser.options.preserveSourceNamespaceContexts = true

        let url = URL(fileURLWithPath: #file)
                .deletingLastPathComponent()
                .deletingLastPathComponent()
                .appendingPathComponent("Resources")
                .appendingPathComponent(file)

        let xml: XMLTools.Infoset
        do {
            xml = try parser.parse(contentsOf: url)
        } catch {
            Nimble.fail("Could not parse xml file: \(error)")
            return
        }

        let nfdDocument = NFD_NFD_Document.deserialize(xml["NFD_Document"])

        // test for attributes
        expect {
            nfdDocument.NFD_Version
        } == "0.0.0"

        expect {
            nfdDocument.Notfalldaten.ID
        } == "ID1"

        // test for value in different namespace
        expect {
            nfdDocument.Notfalldaten.NFD_Versicherter.Versicherter.Versicherten_ID
        } == "A000000000"

        // test for multiple occurring values / arrays
        expect {
            nfdDocument.Notfalldaten.NFD_Befunddaten?.Besondere_Hinweise?.Implantate.count
        } == 9

        expect {
            nfdDocument.Notfalldaten.NFD_Befunddaten?.Besondere_Hinweise?.Implantate
                    .filter {
                $0.Typenbezeichnung == "St. Jude Medical Current Accel"
            }
                    .count
        } == 1

        // test for enum handling
        expect {
            nfdDocument.Notfalldaten.NFD_Befunddaten?.Diagnosen[0].Diagnosesicherheit
        } == NFD_DiagnosesicherheitEnum.V

        // test for removing illegal characters (E-Mail -> EMail)
        expect {
            nfdDocument.Notfalldaten.NFD_Versicherter.NFD_Benachrichtigungskontakt?.NFD_BK_Kommunikation[0]
                    .Kommunikationsdaten.EMail
        } == "chantal@daisy_chain.com"

        // test for optional elements (minOccurs = "0")
        expect {
            nfdDocument.Notfalldaten.NFD_Befunddaten?.Allergien_Unvertraeglichkeiten[0].Reaktion
        } == "a"

        expect {
            nfdDocument.Notfalldaten.NFD_Befunddaten?.Allergien_Unvertraeglichkeiten[1].Reaktion
        }.to(beNil())

        // test for optional attributes (use = "required")
        expect {
            nfdDocument.Notfalldaten.NFD_Befunddaten?.Diagnosen[0].Diagnose_Code_System?.DC_Version
        } == "String"

        expect {
            nfdDocument.Notfalldaten.NFD_Befunddaten?.Diagnosen[1].Diagnose_Code_System?.DC_Version
        }.to(beNil())
    }

    func testXmlToStructDeserializeGenericNamespaces() {
        let file = "nfd_v1_3_genericNamespaces.xml"
        let parser = XMLTools.Parser()
        parser.options.preserveSourceNamespaceContexts = true

        let url = URL(fileURLWithPath: #file)
                .deletingLastPathComponent()
                .deletingLastPathComponent()
                .appendingPathComponent("Resources")
                .appendingPathComponent(file)

        let xml: XMLTools.Infoset
        do {
            xml = try parser.parse(contentsOf: url)
        } catch {
            Nimble.fail("Could not parse xml file: \(error)")
            return
        }

        let nfdDocument = NFD_NFD_Document.deserialize(xml["NFD_Document"])

        // test for attributes
        expect {
            nfdDocument.NFD_Version
        } == "0.0.0"

        expect {
            nfdDocument.Notfalldaten.ID
        } == "ID1"

        // test for value in different namespace
        expect {
            nfdDocument.Notfalldaten.NFD_Versicherter.Versicherter.Versicherten_ID
        } == "A000000000"

        // test for multiple occurring values / arrays
        expect {
            nfdDocument.Notfalldaten.NFD_Befunddaten?.Besondere_Hinweise?.Implantate.count
        } == 9

        expect {
            nfdDocument.Notfalldaten.NFD_Befunddaten?.Besondere_Hinweise?.Implantate
                    .filter {
                $0.Typenbezeichnung == "St. Jude Medical Current Accel"
            }
                    .count
        } == 1

        // test for enum handling
        expect {
            nfdDocument.Notfalldaten.NFD_Befunddaten?.Diagnosen[0].Diagnosesicherheit
        } == NFD_DiagnosesicherheitEnum.V

        // test for removing illegal characters (E-Mail -> EMail)
        expect {
            nfdDocument.Notfalldaten.NFD_Versicherter.NFD_Benachrichtigungskontakt?.NFD_BK_Kommunikation[0]
                    .Kommunikationsdaten.EMail
        } == "chantal@daisy_chain.com"

        // test for optional elements (minOccurs = "0")
        expect {
            nfdDocument.Notfalldaten.NFD_Befunddaten?.Allergien_Unvertraeglichkeiten[0].Reaktion
        } == "a"

        expect {
            nfdDocument.Notfalldaten.NFD_Befunddaten?.Allergien_Unvertraeglichkeiten[1].Reaktion
        }.to(beNil())

        // test for optional attributes (use = "required")
        expect {
            nfdDocument.Notfalldaten.NFD_Befunddaten?.Diagnosen[0].Diagnose_Code_System?.DC_Version
        } == "String"

        expect {
            nfdDocument.Notfalldaten.NFD_Befunddaten?.Diagnosen[1].Diagnose_Code_System?.DC_Version
        }.to(beNil())
    }

    static var allTests = [
        ("testXmlToStructDeserialize", testXmlToStructDeserialize),
        ("testXmlToStructDeserializeGenericNamespaces", testXmlToStructDeserializeGenericNamespaces)
    ]
}
