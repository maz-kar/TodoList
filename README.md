# TodoList

## Description:
This is a test app to create the CoinGeckoApp with SwiftUI and also writing as much as possible unit and maybe UI tests for it.

## Frameworks:
- Swift
- SwiftUI
- CoreData

## Project Structure:
We have: 
- Launch screen
- HomeView

## Core Data:
 1. DataModel was added to the Bundle.
 2. Entity, attribute and type were added to DataModel.
 3. A View was added to the project in order to show our data (AddItemView).
 4. A ViewModel class was added to the view.
 5. We made a reference out of AddItemViewModel inside of the View.
 6. A NSPersistentContainer was instantiated inside of the init method.
 7. after creation of container, we need to load the persisted data from the container.
 8. We also need a fetchRequest func, which will be called inside of the init method.
 9. What we do inside of this func is at 1st to create a request, and the set our Published savedEntities with the fetchedData from the request
 10. lastly we need to implement our functionalities like: add, delete, save, update.

## TODO:
 Hot Fixes:
 - Add Animation to the Add Something button.
 - Add functionality to Edit button: it must go to a mode which has an extra delete button in left and sorting button in right.
 - After showing the savedEntities in HomeView, add dynamic red and green circles to the entities on their left
 - After deleting all entities, the middleText will not be shown unless reopening the app.
 - Add the alert: "Your new todo item must be at least 3 characters long!!! 3 emojies."
 - Add an animation when tapped between red and green
 - Everything is too much to left 
 
Final Fixes:
 - Add dark mode. Align in the end all the colors in both light and dark mode.
 - Add color scheme.
 - Add launch screen.
 - Save entities first with user defaults, CoreData and ultimately with SwiftData.
 - Back button color of the AddItemView

