SCORM API wrappers

Copyright (c) 2008 Philip Hutchison
MIT-style license. Full license text can be found at 
http://www.opensource.org/licenses/mit-license.php


The SCORM API Wrappers come in three varieties:

* JavaScript
* ActionScript 2 (AS2)
* ActionScript 3 (AS3)

All three wrappers are SCORM version-agnostic, and will work with both SCORM 1.2 and SCORM 2004.

Both of the ActionScript wrappers require the JavaScript wrapper; the AS wrappers use ExternalInterface to invoke functions contained in the JavaScript wrapper. If the JS wrapper is not present, the ActionScript wrappers will not work.

These wrappers were inspired by APIWrapper.js, which was created by the ADL and Concurrent Technologies Corporation, distributed by the ADL (http://www.adlnet.gov/scorm).

The SCORM.API.find() and SCORM.API.get() functions are based on ADL code, which was modified by Mike Rustici (http://www.scorm.com/resources/apifinder/SCORMAPIFinder.htm), then further modified by Philip Hutchison.