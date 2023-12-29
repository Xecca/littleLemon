//
//  FetchedObjects.swift
//  LittleLemonApp
//
//  Created by Andrei Ponomarenko on 29.12.2023.
//

import CoreData
import Foundation
import SwiftUI

struct FetchedObjects<T, Content>: View where T : NSManagedObject, Content : View {
    
    let content: ([T]) -> Content
    
    var request: FetchRequest<T>
    var results: FetchedResults<T>{ request.wrappedValue }
    
    init(
        predicate: NSPredicate = NSPredicate(value: true),
        sortDescriptors: [NSSortDescriptor] = [],
        @ViewBuilder content: @escaping ([T]) -> Content
    ) {
        self.content = content
        self.request = FetchRequest(
            entity: T.entity(),
            sortDescriptors: sortDescriptors,
            predicate: predicate
        )
    }
    
    var body: some View {
        self.content(results.map { $0 })
    }
    
}

