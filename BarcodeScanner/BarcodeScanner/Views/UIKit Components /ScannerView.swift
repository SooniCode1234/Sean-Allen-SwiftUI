//
//  ScannerView.swift
//  BarcodeScanner
//
//  Created by Sooni Mohammed on 2020-11-12.
//

import SwiftUI

struct ScannerView: UIViewControllerRepresentable {
    
    @Binding var scannedCode: String
    @Binding var alertItem: AlertItem?
    
    func makeUIViewController(context: Context) -> ScannerVC {
        ScannerVC(scannerDelegate: context.coordinator)
    }
    
    func updateUIViewController(_ uiViewController: ScannerVC, context: Context) {}

    func makeCoordinator() -> Coordinator {
        Coordinator(scannerView: self)
    }

    
    final class Coordinator: NSObject, ScannerVCDelegate {
 
        init(scannerView: ScannerView) {
            self.scannerView = scannerView
        }
        
        private let scannerView: ScannerView
        func didFind(barcode: String) {
            scannerView.scannedCode = barcode
        }
        
        func didSurface(error: CameraError) {
            switch error {
            case .invalidDeviceInput:
                scannerView.alertItem = AlertContext.invalidDeviceInput
            case .invalidScannedValue:
                scannerView.alertItem = AlertContext.invalidScannedType
            }
        }
    }
}

struct ScannerView_Previews: PreviewProvider {
    static var previews: some View {
        ScannerView(scannedCode: .constant("123456"), alertItem: .constant(AlertItem(title: "", message: "", dismissButton: .default(Text("")))))
    }
}
