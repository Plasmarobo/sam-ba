# Building SAM-BA

#### Raspberry Pi dependencies
SAM-BA requires QT 5.6+ and as of the time of this writing raspbian does not ship with this version.

The user must either cross-compile QT 5.6+ for the Pi from a linux host.
Cross-compile instructions may be found here:
http://www.qtrpi.com/faq

#### Linux

From the sam-ba directory:
```
sudo ./setup.sh
```
Ensure theer are no errors.
`sam-ba` should be present in /bin

The Environment may be customized in `env.sh`

