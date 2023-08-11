//
//  CarPlaySceneDelegate.swift
//  Demo-CarPlayMusic
//
//  Created by Kumar Saurav on 11/08/23.
//

import Foundation
import CarPlay

class CarPlaySceneDelegate: UIResponder,
                            CPTemplateApplicationSceneDelegate {

    var carPlayTemplateManager: CarPlayTemplateManager?
    
    // CarPlay connected
    func templateApplicationScene(
        _ templateApplicationScene: CPTemplateApplicationScene,
        didConnect interfaceController: CPInterfaceController
    ) {
        carPlayTemplateManager = CarPlayTemplateManager()
        carPlayTemplateManager?.connect(interfaceController)
    }
    
    // CarPlay disconnected
    func templateApplicationScene(
        _ templateApplicationScene: CPTemplateApplicationScene,
        didDisconnectInterfaceController
        interfaceController: CPInterfaceController
    ) {
        carPlayTemplateManager?.disconnect()
        carPlayTemplateManager = nil
    }
}
