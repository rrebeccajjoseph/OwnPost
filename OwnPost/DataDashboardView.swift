//
//  DataDashboardView.swift
//  OwnPost
//
//  Created by Rebecca Joseph on 11/15/24.
//

import Foundation
import SwiftUI

struct DataDashboardView: View {
    @StateObject private var viewModel: DataDashboardViewModel
    
    init(user: User) {
        _viewModel = StateObject(wrappedValue: DataDashboardViewModel(user: user))
    }
    
    var body: some View {
        List {
            Section(header: Text("Data Profits")) {
                ForEach(DataType.allCases, id: \.self) { dataType in
                    HStack {
                        Text(dataType.rawValue)
                        Spacer()
                        Text("$\(viewModel.dataProfits[dataType] ?? 0, specifier: "%.2f")")
                    }
                }
            }
            
            Section {
                Button("Update Profits") {
                    viewModel.updateProfits()
                }
            }
        }
        .navigationTitle("Data Dashboard")
    }
}
