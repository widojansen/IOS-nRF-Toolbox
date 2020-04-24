//
//  DFU.LogLevel+Ext.swift
//  nRF Toolbox
//
//  Created by Nick Kibysh on 13/02/2020.
//  Copyright © 2020 Nordic Semiconductor. All rights reserved.
//

import iOSDFULibrary

extension LogLevel {
    var level: LogType {
        switch self {
        case .application: return .application
        case .debug: return .debug
        case .error: return .error
        case .info: return .info
        case .verbose: return .verbose
        case .warning: return .warning
        }
    }
}
