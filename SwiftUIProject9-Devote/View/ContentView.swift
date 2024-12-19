//
//  ContentView.swift
//  SwiftUIProject9-Devote
//
//  Created by Yaro Paul  on 18/12/2024.
//

import CoreData
import SwiftUI

struct ContentView: View {

    @State var task: String = ""

    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [
            NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)
        ],
        animation: .default)
    private var items: FetchedResults<Item>

    private func addItem() {
        withAnimation {
            let newItem = Item(context: viewContext)
            newItem.timestamp = Date()
            newItem.task = task
            newItem.completion = false
            newItem.id = UUID()

            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }

            task = ""
            hideKeyboard()
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }

    private var isButtonDisabled: Bool {
        task.isEmpty
    }

    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    VStack(spacing: 16) {
                        TextField("New Task", text: $task)
                            .padding()
                            .background(Color(UIColor.systemGray6))
                            .cornerRadius(10)

                        Button(
                            action: {
                                addItem()
                            },
                            label: {
                                Spacer()
                                Text("SAVE")
                                Spacer()
                            }
                        )
                        .disabled(isButtonDisabled)
                        .padding()
                        .font(.headline)
                        .foregroundColor(.white)
                        .background(isButtonDisabled ? Color.gray : Color.pink)
                        .cornerRadius(10)
                    } 
                    .padding()

                    List {
                        ForEach(items) { item in
                            NavigationLink {
                                VStack(alignment: .leading) {
                                    Text(item.task ?? "")
                                        .font(.headline)
                                        .fontWeight(.bold)

                                    Text(
                                        "Item at \(item.timestamp!, formatter: itemFormatter)"
                                    )
                                    .font(.footnote)
                                    .foregroundColor(.gray)
                                }
                            } label: {
                                VStack(alignment: .leading) {
                                    Text(item.task ?? "")
                                        .font(.headline)
                                        .fontWeight(.bold)

                                    Text(
                                        item.timestamp!,
                                        formatter: itemFormatter
                                    )
                                    .font(.footnote)
                                    .foregroundColor(.gray)
                                }
                            }
                        }
                        .onDelete(perform: deleteItems)
                    }
                    .listStyle(InsetGroupedListStyle())
                    .shadow(color: Color(red:0, green:0, blue:0, opacity:0.3), radius: 12)
                    .padding(.vertical, 0)
                    .frame(maxHeight: 640)
                }
            }
            .onAppear(){
                UITableView.appearance().backgroundColor = UIColor.clear
            }
            .navigationBarTitle("Daily Tasks", displayMode: .large)
            .toolbar {
                #if os(iOS)
                    ToolbarItem(placement: .navigationBarTrailing) {
                        EditButton()
                    }
                #endif
            }
            .background(
                BackgroundImageView()
            )
            .background(backgroundGradient.ignoresSafeArea(.all))
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

#Preview {
    ContentView().environment(
        \.managedObjectContext,
        PersistenceController.preview.container.viewContext)
}
