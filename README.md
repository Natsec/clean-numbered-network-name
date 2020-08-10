# Clean numbered network name
On Windows 10, the OS seems to not remember a device sharing its connection and will create a new network name each time you connect the same device.

This seems to appear in the following scenarios :
- using USB tethering to share connection with a device

## Preventing the issue
It seems impossible to prevent this behavior. Although some people have found solutions, they are either deprecated or not convenient (see [here](https://superuser.com/questions/729305/prevent-windows-from-creating-new-network-names-when-tethering-with-android)).

## Deleting the relevant network profiles
Without preventing the issue, it is still possible to delete the relevant network profiles by going to the `"HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\NetworkList\Profiles"` registry key, and deleting the ones that bother you.

If just like me, you waited some time to investigate this annoying behavior, you could have 150+ entries, and deleting them by hand is painful.

Thanks to [stackoverflow](https://stackoverflow.com/questions/39619580/how-to-loop-through-registry-with-cmd), I could craft a script that will check the name of every network profile, and delete the ones that match a numbered network name.

## Usage
The script has to be launched as an Administrator. this is required because accessing/editing registry keys requires admin rights.

Your network name can be different depending on your system language. For a french system, the network name is `Réseau 23`. To change the prefix of your numbered network name, simply edit the `prefix` variable. I use `.` to match accentuated characters because `findstr` does not match them.

The script will only list matching network names, if you are OK with what it finds, uncomment `REM reg delete "%%k" /f` by removing `REM`, and it will delete them.

## Automation
For not having to remember to launch the script every once in a while, you could make it launch at each boot.

To do this, hit `Win+R` and type `shell:startup`, then copy the script in the folder that just opened. You can comment the last line with `REM pause` to avoid being prompted at each boot.
