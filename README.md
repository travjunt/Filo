# Filo 

The purpose of this application is to allow a user to view cryptocurrency information such as Symbol, Name, Price, Rank, Marketcap, 24hr Volume, and Total Supply. The information is retrieved from coinmarketcap.com's API and uses the Realm Database to persist and display the data.  

The information is displayed in a tableView. A user can tap on a given cell to view more information about that cryptocurrency.

If the user would like to view the most updated information, the user can tap the refresh button in the navigation bar which will make a new network request and reload the table view with the updated data. 

## Installation

Git clone:  `git clone git@github.com:travjunt/Filo.git` or ![Download .zip](https://github.com/travjunt/Filo/archive/\master.zip)

To compile the app,  open the .xcworkspace file. Choose a simulator or connect a device, click "Run".
