# RPG-Maker-MZ-Framework-for-Xcode-12

What Does This Framework Do?
With this framework you can copy your deployed RPG Maker MZ project into this Xcode 12 Project and run - and publish - your games on iOS, iPadOS and now - macOS Big Sur. 

Prerequisites:
You will need a RPG Maker MZ Project, 
RPG Maker MZ
Mac
iOS Device 
Xcode 12 
Apple Developer Account (Signing Certificate, Provisioning Profiles, Etc.) 

See Official Apple Developer Documentation if you’re unfamiliar on how to develop and publish for Apple Platforms. 

Instructions:

Step 1: Export Your Game in RPG Maker MZ
Under File menu, select Deployment. Make sure to use Web Browsers / iOS / Android option. 

Step 2: Open this Xcode 12 Project.

Step 3: Copy Your Game Folder
Right click the ViewControllwer.swift file (or general area) on the left panel (file hierarchy).
Select Add Files to "RPG Maker MZ Framework for Xcode 12"... from the menu
Select your games www folder (usually in Documents/Output) and select “Add”
Make sure to select the “Copy items if needed” option.
Select Create folder references.
Your www folder should now be in the same level as ViewController.swift file

Step 4: Allow MZ to start without focus (2 METHODS)

METHOD 1:
From the left panel in Xcode, navigate to www > js > rmmz_managers.js

Search for the SceneManager.isGameActive function - this will be located around line 2107. 

Replace the code with the following in order skip the check on focus:



SceneManager.isGameActive = function() {
    return true;
    try {
        return window.top.document.hasFocus();
    } catch (e) {
        // SecurityError
        return true;
    }
};




METHOD 2:
If you don’t feel like replacing the code in Method 1, you can also do the following:
Copy the rmmz_managers.js file, in the project.
Paster 

www > js > rmmz_managers.js

WARNING: YOUR MZ GAME WILL NOT WORK IF YOU DO NOT DO THIS STEP!!!!!!!!!!!!!!

And that’s it! You can now run your game in simulator mode for all platforms (including macOS so long as you’re on a Big Sur machine), or plug in an iOS/iPadOS device (so long as you have developer permissions). 

Storyboard & Xcode Extras
Extra Storyboard Added in Main.Storyboard. This was added to create a “Pre-App” event so that any developer can add extra features such as In-App Purchases, Multiple RPG Maker MZ-based mini-games, Ads, etc., to this app. This is a feature that will be built out extensively in the future. 
If you want your app to go straight to your RPG Maker MZ game, simply go to Main Storyboard, look for the right arrow ( “—>”) and drag it to the ViewController storyboard (where your RPG Maker MZ / WKWebview reside). 
