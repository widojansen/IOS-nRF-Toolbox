//
//  MacrosCommandContainer.swift
//  UART
//
//  Created by Nick Kibysh on 26/08/2020.
//  Copyright © 2020 Nordic Semiconductor. All rights reserved.
//

import Foundation

/// Struct contains command and information about command inside macros
public struct MacrosCommandContainer {
    public var command: Command
    public var repeatCount: Int
    /// Delay between repeats in milliseconds
    public var delay: Int
}

