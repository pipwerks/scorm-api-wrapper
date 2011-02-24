SCORM API wrappers

Copyright (c) 2008 Philip Hutchison
MIT-style license. Full license text can be found at 
http://www.opensource.org/licenses/mit-license.php

Inspired by APIWrapper.js, which was a demo file created by the ADL and Concurrent Technologies Corporation.

The SCORM.API.find() and SCORM.API.get() functions are based on ADL code, which was modified by Mike Rustici (http://www.scorm.com), then further modified by Philip Hutchison.

WARNING: Use at your own risk! This class is provided as-is with no implied warranties or guarantees.

----------

The SCORM API Wrappers come in three varieties:

* JavaScript
* ActionScript 2 (AS2)
* ActionScript 3 (AS3)

All three wrappers are SCORM version-agnostic, and will work with both SCORM 1.2 and SCORM 2004.

Both of the ActionScript wrappers require the JavaScript wrapper; the AS wrappers use ExternalInterface to invoke functions contained in the JavaScript wrapper. If the JS wrapper is not present, the ActionScript wrappers will not work.

When testing locally, the ActionScript wrappers also require you to change your Flash Player settings to allow local SWFs to execute ExternalInterface commands. Change your security settings using this link:
http://www.macromedia.com/support/documentation/en/flashplayer/help/settings_manager04.html