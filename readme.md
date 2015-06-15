Created by Philip Hutchison, January 2008  
https://github.com/pipwerks/scorm-api-wrapper

Copyright (c) Philip Hutchison  
MIT-style license: http://pipwerks.mit-license.org/

Inspired by APIWrapper.js, which was a demo file created by the ADL and Concurrent Technologies Corporation.

The SCORM.API.find() and SCORM.API.get() functions are based on ADL code, which was modified by Mike Rustici (http://www.scorm.com), then further modified by Philip Hutchison.

WARNING: Use at your own risk! These files are provided as-is with no implied warranties or guarantees.

##Background 

These wrappers are intended to make your life easier so you don't need to be a SCORM expert to add SCORM support to your e-learning course.

The SCORM API wrappers are an abstraction layer that makes adding SCORM code to your course a much simpler, less confusing task. They provide simple logic and error-checking for your course's SCORM code, and include some auto-handling, such as setting cmi.exit (aka cmi.core.exit) when exiting a course.

The SCORM API Wrappers come in three varieties:

* JavaScript
* ActionScript 2 (AS2)
* ActionScript 3 (AS3)

All three wrappers are SCORM version-agnostic, and will work with both SCORM 1.2 and SCORM 2004. Both of the ActionScript wrappers require the JavaScript wrapper; the AS wrappers use ExternalInterface to invoke functions contained in the JavaScript wrapper. If the JS wrapper is not present, the ActionScript wrappers will not work.

The ActionScript wrappers use ExternalInterface to communicate with JavaScript. ExternalInterface will not work in a local environment unless you change your Flash Player security settings.
