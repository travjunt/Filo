# Filo 

The purpose of this application is to allow a user to view cryptocurrency information such as Symbol, Price, Rank, Marketcap, and name. 

The information is displayed in a tableView. 

If the user would like to view the most updated information, the user can tap the refresh button in the navigation bar which will make a new network request and reload the table view with the updated data. 

To compile the app, download the .zip and open the project in xcode. Then press the play button in xcode to build and run the app. 



## iPhone X Simulator Realm DB filepath 
```

(lldb) po Realm.Configuration.defaultConfiguration.fileURL
po Realm.Configuration.defaultConfiguration.fileURL▿ Optional<URL>
▿ some : file:///Users/travis/Library/Developer/CoreSimulator/Devices/837B1F82-BA33-458C-A424-BB41F9A7EEE4/data/Containers/Data/Application/DCCBCF1D-4CEE-4BF3-A9ED-A9CF0ADB377B/Documents/default.realm
- _url : file:///Users/travis/Library/Developer/CoreSimulator/Devices/837B1F82-BA33-458C-A424-BB41F9A7EEE4/data/Containers/Data/Application/DCCBCF1D-4CEE-4BF3-A9ED-A9CF0ADB377B/Documents/default.realm

▿ Optional<URL>
▿ some : file:///Users/travis/Library/Developer/CoreSimulator/Devices/837B1F82-BA33-458C-A424-BB41F9A7EEE4/data/Containers/Data/Application/DCCBCF1D-4CEE-4BF3-A9ED-A9CF0ADB377B/Documents/default.realm
- _url : file:///Users/travis/Library/Developer/CoreSimulator/Devices/837B1F82-BA33-458C-A424-BB41F9A7EEE4/data/Containers/Data/Application/DCCBCF1D-4CEE-4BF3-A9ED-A9CF0ADB377B/Documents/default.realm

(lldb) 

```

