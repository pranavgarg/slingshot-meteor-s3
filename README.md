# Meteor Slingshot Demo

## Package
* Slingshot  => edgee:slingshot
* Jade  =>  mquandalle:jade
* Coffeescript  => coffeescript
* Bootstrap => twbs:bootstrap
* Accounts Password  => accounts-password
* Accounts UI => ian:accounts-ui-bootstrap-3 

## About
This project is a demo to upload files on the S3 using [meteor slingshot](https://github.com/CulturalMe/meteor-slingshot) which bypasses the meteor server to upload the 
  file directly to S3. 
  
  **Salient Features**
   
  Uses the S3 Temp credentials for allowing signed policy which lasts for a predefined period

## Running DEMO
create a settings.json file from settings.json.example. 
Provide the credentials to AWS S3 in settings.json. 

On command prompt/Terminal run:
meteor --settings settings.json

and on browser open http://localhost:3000

## Credit
https://github.com/ppryde/Meteor-Slingshot-S3-Multiple-Demo.git
 
 
   