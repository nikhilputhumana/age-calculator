# Age Calculator & Zodiac Sign Finder

A flutter app to accurately calculate the age of the user and their Zodiac sign.

## How to install?

Go to Releases tab and install the apk or click [here](https://github.com/nikhilputhumana/age-calculator-app/releases/download/v1.0.0/app-release.apk).

## How it works / How to use

* User enters the date of birth.
* The age and zodiac sign is shown when we press the calculate button.


## Notes to remember (for personal use)

### Connecting mobile device with PC

* Connect to same wifi.
* Turn on wireless debugging in mobile device.
* Allow wireless debugging (when dialogue box appears).
* Get the ip address and port number from wireless debugging settings.
* Execute the following command

```bash
adb connect <ip address with port>
```

Then device name will be visible in available devices (in VS Code).


### After adding the flutter_launcher_icons into pubspec.yaml

Run following commands

```bash
flutter pub get 
flutter pub run flutter_launcher_icons:main
```
