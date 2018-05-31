# Building SAM-BA


## Pre-requisites

- Qt 5.9.0

  Download from [qt.io](http://www.qt.io/download-open-source/#section-3).

  For Linux, use package "Qt 5.9.0 for Linux 64-bit".

  For Windows, use package "Qt 5.9.0 for Windows 32-bit"

- J-Link SDK 5.02k

  Download from SEGGER, not publicly available.

  Other versions can probably be used, but the qmake file for the J-Link plugin
must be changed accordingly.


## Building

The build uses 3 directories:

- source code directory (git checkout)
- build directory
- release directory

We will refer to these directories in the rest of this documentation as
{SRCDIR}, {BUILDDIR} and {RELEASEDIR}.  {RELEASEDIR} must be an absolute path.

The Qt installation directory will be referred to as {QTDIR}.

SAM-BA can be built either using command-line commands or using Qt Creator.

### Using command line

#### Cross-compile for raspberry pi

1. Edit `env.sh` to reflect your configuration

2. Configure your raspberry pi for ssh access from the x86_64 host

3. Run `sudo ./setup.sh` from the root of the repo

  The setup will install the dependencies for building sam-ba, and also the cross-compile toolchain for raspberry pi. The system will cross-compile sam-ba and deploy it to the raspberry pi targeted in `env.sh`.

#### Linux

1. Checkout the source in {SRCDIR}

2. Create directory {BUILDDIR}

3. (optional) Change path of J-Link SDK in
``plugins/connection/jlink/jlink.pro``

4. Go in directory {BUILDDIR} and run
``{QTDIR}/5.9/gcc_64/bin/qmake -r {SRCDIR}/sam-ba.pro``.  This will generate
the makefiles in {BUILDDIR} from the qmake templates in the source tree.

5. Go in directory {BUILDDIR} and run
``make INSTALL_ROOT={RELEASEDIR} install``

6. The release material should now be present in {RELEASEDIR} directory.

#### Windows

1. Checkout the source in {SRCDIR}

2. Create directory {BUILDDIR}

3. (optional) Change path of J-Link SDK in
``plugins\connection\jlink\jlink.pro``

4. Go in directory {BUILDDIR} and run:
``{QTDIR}\5.9\mingw53_32\bin\qmake -r {SRCDIR}\sam-ba.pro``.  This will
generate the makefiles in {BUILDDIR} from the qmake templates in the source
tree.

5. Add MingW32 directory to path:
``set path=%path%;{QTDIR}\Tools\mingw53_32\bin``

6. Go in directory {BUILDDIR} and run:
``mingw32-make INSTALL_ROOT={RELEASEDIR} install``

7. The release material should now be present in {RELEASEDIR} directory.


### Using Qt Creator

#### Linux

1. Start Qt Creator

2. Load ``sam-ba.pro`` from {SRCDIR}

3. Select kit "Desktop Qt 5.9.0 GCC 64bit" and click "Configure Project"

4. (optional) Change path of J-Link SDK in
``plugins/connection/jlink/jlink.pro``.

5. (optional) In the bottom of the left toolbar, click on the "sam-ba Release"
or " sam-ba Debug" icon to select the desired build configuration.

4. Click on the "Projects" icon in the left toolbar

5. Select "Build" from the "Build | Run" selector below the kit name

6. Set the "Build directory:" field to {BUILDDIR}

5. Select "Run" from the "Build | Run" selector below the kit name

6. In "Deployment", click "Add Deploy Step" and select "Make"

7. In "Make arguments:" fields, type:
``INSTALL_ROOT={RELEASEDIR} install``
  
8. In the "Build" menu, click "Build All"

10. Click "4 Compile Output" at the bottom of the screen to see the build
progress

11. Once the build is complete, in the "Build" menu, click "Deploy All"

12. The release material should now be present in {RELEASEDIR} directory.

#### Windows

1. Start Qt Creator

2. Load ``sam-ba.pro`` from {SRCDIR}

3. Select kit "Desktop Qt 5.9.0 MingW 32 bit" and click "Configure Project"

4. (optional) Change path of J-Link SDK in
``plugins\connection\jlink\jlink.pro``.

5. (optional) In the bottom of the left toolbar, click on the "sam-ba Release"
or " sam-ba Debug" icon to select the desired build configuration.

4. Click on the "Projects" icon in the left toolbar

5. Select "Build" from the "Build | Run" selector below the kit name

6. Set the "Build directory:" field to {BUILDDIR}

5. Select "Run" from the "Build | Run" selector below the kit name

6. In "Deployment", click "Add Deploy Step" and select "Make"

7. In "Make arguments:" fields, type:
``INSTALL_ROOT={RELEASEDIR} install``

8. In the "Build" menu, click "Build All"

10. Click "4 Compile Output" at the bottom of the screen to see the build
progress

11. Once the build is complete, in the "Build" menu, click "Deploy All"

12. The release material should now be present in {RELEASEDIR} directory.

