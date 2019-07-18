Read this before you open the Swift file

To build the swift file app, you will need to install CocoaPods and Alamofire that will help the app to communicate with the API and also the CPF-CNPJ Validator that will validate the user's entry.
To install both CocoaPods and Alamofire, follow the instructs bellow:

_________________ ____________________ ____________________ ____________________ ____________________ ____________________ ____________________

Installing CocoaPods

Using the terminal, get into your project folder.

Type the command: sudo gem install cocoapods

It will request you to enter your admin password to complete the installation

After the installation, type the command: pod init

To make sure the command worked, type "ls" and check if the "Podfile" folder was created into your Project's folder.

____________________ ____________________ ____________________ ____________________ ____________________ ____________________ ____________________ ____________________

Installing AlamoFire

Open the Podfile using the command: open Podfile

After opening the file, you must paste the lines bellow into the file's body.
target 'Desafio_Santander' do
use_frameworks!
pod 'Alamofire', '~> 5.0.0-beta.5'


You can now save and close your Podfile

Type the command: pod install 

All the alterations made in your Podfile will be installed in this step. You will receive in the prompt, a message informing you that the installation is complete

________________________ ____________________ ____________________ ____________________ ____________________ ____________________ ____________________ ____________________
To install CPF-CNPJ Validator, follow the steps bellow:

Open the Podfile using the command: open Podfile

After opening the file, you must paste the lines bellow into the file's body after the Alamofire's line:
pod 'CPF-CNPJ-Validator'


You can now save and close your Podfile

Type the command: pod install 
To log into the bank, you must type a real CPF-CNPJ or a valid e-mail. Your password must contain at least one SPECIAL CHARACTERE; CAPITAL LETTER and NUMBER, otherwise you won’t be able to log in.


All the alterations made in your Podfile will be installed in this step. You will receive in the prompt, a message informing you that the installation is complete

Note:
From now on, to have access your implementation of Alamofire, you must open the project file that has ".xcworkspace" extension.

    
        
