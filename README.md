# Audio Screensaver
![demo](demo.png)
*the smoking worm dances over your screen to the music*

## Try it out
You can download a prebuilt .jar file [from here](build/audioScreensaver_standalone.jar). If You have Java installed on your machine, you can run it by double clicking it. For the worm to react to the music that is currently playing, you have to ensure that system monitor is set as the input device for recording.

**Warning** The program opens in fullscreen mode and doesn't have any stop button. To exit try hitting <kbd>ESC</kbd>, <kbd>ALT</kbd>+<kbd>F4</kbd>, <kbd>CRTL</kbd>+<kbd>Q</kbd>, ...

## Fool around
This program is written in [Processing 3](https://processing.org/) so you need to have that installed if you want to play around with the code. Download the code from this page, open it in the Processing IDE and click 'run'.

If you want to build a standalone .jar by yourself, open the code in the Processing IDE and click File > Export Application. This will create a folder `application._` where `_` is your operating system. It contains a folder `lib`. Inside that folder, run [build.sh](build.sh) (make sure to `chmod +x build.sh` first). This will create `audioScreensaver_standalone.jar` which is the desired .jar. It can be run by typing `java -jar audioScreensaver_standalone.jar` in a terminal or by double clicking.

---
This software comes with no warranty.
