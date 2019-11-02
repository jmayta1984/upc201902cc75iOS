//
//  TaskCellView.swift
//  ToDoSwiftUI
//
//  Created by Jorge Mayta Guillermo on 11/2/19.
//  Copyright © 2019 Cibertec. All rights reserved.
//

import SwiftUI

import Foundation
struct TaskCellView: View {
    var task: Task
    var body: some View {
        VStack {
            Text(task.text!)
        }
    }
}
