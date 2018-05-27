# MarvelDemo

I am using Clean architecture overall in the app. 

Controller are light weight and data sources are separated from controller. Controller interact with configurator for fetching the data and updating the data into DataSources. Interactor ask worker for the data. Worker decide either it has to fetch the data from local store or remote store. Local store has responsibility  to fetch the data from cache. Remote store perform network calls. Worker update the Interactor upon receiving the data. Interactor inform the presentator to show the data. 

DataSources are separated from the controller and it interact with controller with closure.


Most of code snippet are taken from stackoverflow and github. All the links for the refernace are mention on them.




