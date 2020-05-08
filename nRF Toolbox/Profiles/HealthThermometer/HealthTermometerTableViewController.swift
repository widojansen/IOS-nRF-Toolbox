/*
* Copyright (c) 2020, Nordic Semiconductor
* All rights reserved.
*
* Redistribution and use in source and binary forms, with or without modification,
* are permitted provided that the following conditions are met:
*
* 1. Redistributions of source code must retain the above copyright notice, this
*    list of conditions and the following disclaimer.
*
* 2. Redistributions in binary form must reproduce the above copyright notice, this
*    list of conditions and the following disclaimer in the documentation and/or
*    other materials provided with the distribution.
*
* 3. Neither the name of the copyright holder nor the names of its contributors may
*    be used to endorse or promote products derived from this software without
*    specific prior written permission.
*
* THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
* ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
* WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
* IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT,
* INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
* NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
* PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
* WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
* ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
* POSSIBILITY OF SUCH DAMAGE.
*/



import UIKit
import CoreBluetooth

private extension Identifier where Value == Section {
    static let temperature: Identifier<Section> = "temperature"
    static let additionalInfo: Identifier<Section> = "additionalInfo"
}

class HealthTermometerTableViewController: PeripheralTableViewController {
    private var temperatureSection = HealthTemperatureSection(id: .temperature)
    private var additionalInfoSection = HealthTemperatureAditionalSection(id: .additionalInfo)
    
    override var peripheralDescription: PeripheralDescription { .healthTemperature }
    override var internalSections: [Section] { [temperatureSection, additionalInfoSection] }
    override var navigationTitle: String { "Health Thermometer" }
    
    override func didUpdateValue(for characteristic: CBCharacteristic) {
        switch characteristic.uuid {
    case CBUUID.Characteristics.HealthTemperature.measurement:
            let temperature = HealthTermometerCharacteristic(data: characteristic.value!)
            temperatureSection.update(with: temperature)
            additionalInfoSection.update(with: temperature)
            tableView.reloadData()
        default:
            super.didUpdateValue(for: characteristic)
        }
    }
}