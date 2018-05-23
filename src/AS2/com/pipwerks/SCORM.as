/*
pipwerks SCORM Wrapper for ActionScript 2
v1.1.20111123

Created by Philip Hutchison, January 2008
https://github.com/pipwerks/scorm-api-wrapper

Copyright (c) Philip Hutchison
MIT-style license: http://pipwerks.mit-license.org/

FLAs published using this file must be published using AS2.
SWFs will only work in Flash Player 8 or higher.

This wrapper is designed to be SCORM version-neutral (it works
with SCORM 1.2 and SCORM 2004). It also requires the pipwerks
SCORM Wrapper for JavaScript in the course's HTML file. The
wrapper can be downloaded from http://github.com/pipwerks/scorm-api-wrapper/

This class uses ExternalInterface. Testing in a local environment
will FAIL unless you set your Flash Player settings to allow local
SWFs to execute ExternalInterface commands.

Use at your own risk! This class is provided as-is with no implied warranties or guarantees.
*/

import flash.external.*;

class com.pipwerks.SCORM {

    private var __connectionActive:Boolean = false,
                __debugActive:Boolean = true;     //Enable (true) or disable (false)


    public function SCORM() {

        var is_EI_available:Boolean = ExternalInterface.available,
            wrapperFound:Boolean = false,
            debugMsg:String = "Initializing SCORM class. Checking dependencies: ";

        if(is_EI_available){

            debugMsg += "ExternalInterface.available evaluates true. ";

            wrapperFound = Boolean(ExternalInterface.call("pipwerks.SCORM.isAvailable"));
            debugMsg += "SCORM.isAvailable() evaluates " +String(wrapperFound) +". ";

            if(wrapperFound){

                debugMsg += "SCORM class file ready to go!  :) ";

            } else {

                debugMsg += "The required JavaScript SCORM API wrapper cannot be found in the HTML document.  Course cannot load.";

            }

        } else {

            debugMsg += "ExternalInterface is NOT available (this may be due to an outdated version of Flash Player).  Course cannot load.";

        }

        __displayDebugInfo(debugMsg);

    }



    // --- public functions --------------------------------------------- //


    public function set debugMode(status:Boolean):Void {
        this.__debugActive = status;
    }

    public function get debugMode():Boolean {
        return this.__debugActive;
    }

    public function connect():Boolean {
        __displayDebugInfo("pipwerks.SCORM.connect() called from class file");
        return __connect();
    }

    public function disconnect():Boolean {
        __displayDebugInfo("pipwerks.SCORM.disconnect() called from class file");
        return __disconnect();
    }

    public function get(param:String):String {
        var str:String = __get(param);
        __displayDebugInfo("data returned from LMS: " +str);
        return str;
    }

    public function set(parameter:String, value:String):Boolean {
        return __set(parameter, value);
    }

    public function save():Boolean {
        return __save();
    }



    // --- private functions --------------------------------------------- //


    private function __connect():Boolean {

        var result:Boolean = false;
        if(!__connectionActive){

            var eiCall:String = String(ExternalInterface.call("pipwerks.SCORM.init"));
            result = __stringToBoolean(eiCall);

            if (result){
                __connectionActive = true;
            } else {
                var errorCode:Number = __getDebugCode();
                if(errorCode){
                    var debugInfo:String = __getDebugInfo(errorCode);
                    __displayDebugInfo("pipwerks.SCORM.init() failed. \n"
                                      +"Error code: " +errorCode +"\n"
                                      +"Error info: " +debugInfo);
                } else {
                    __displayDebugInfo("pipwerks.SCORM.init failed: no response from server.");
                }
            }
        } else {
              __displayDebugInfo("pipwerks.SCORM.init aborted: connection already active.");
        }

        __displayDebugInfo("__connectionActive: " +__connectionActive);

        return result;
    }


    private function __disconnect():Boolean {

        var result:Boolean = false;
        if(__connectionActive){
            var eiCall:String = String(ExternalInterface.call("pipwerks.SCORM.quit"));
            result = __stringToBoolean(eiCall);
            if (result){
                __connectionActive = false;
            } else {
                var errorCode:Number = __getDebugCode();
                var debugInfo:String = __getDebugInfo(errorCode);
                __displayDebugInfo("pipwerks.SCORM.quit() failed. \n"
                                  +"Error code: " +errorCode +"\n"
                                  +"Error info: " +debugInfo);
            }
        } else {
            __displayDebugInfo("pipwerks.SCORM.quit aborted: connection already inactive.");
        }
        return result;
    }


    private function __get(parameter:String):String {

        var returnedValue:String = "";

        if (__connectionActive){

            returnedValue = String(ExternalInterface.call("pipwerks.SCORM.get", parameter));
            var errorCode:Number = __getDebugCode();

            //GetValue returns an empty string on errors
            //Double-check errorCode to make sure empty string
            //is really an error and not field value
            if (returnedValue == "" && errorCode != 0){
                var debugInfo:String = __getDebugInfo(errorCode);
                __displayDebugInfo("pipwerks.SCORM.get(" +parameter +") failed. \n"
                                  +"Error code: " +errorCode +"\n"
                                  +"Error info: " +debugInfo);
            }
        } else {
            __displayDebugInfo("pipwerks.SCORM.get(" +parameter +") failed: connection is inactive.");
        }
        return returnedValue;
    }


    private function __set(parameter:String, value:String):Boolean {

        var result:Boolean = false;
        if (__connectionActive){
            var eiCall:String = String(ExternalInterface.call("pipwerks.SCORM.set", parameter, value));
            result = __stringToBoolean(eiCall);
            if(!result){
                var errorCode:Number = __getDebugCode();
                var debugInfo:String = __getDebugInfo(errorCode);
                __displayDebugInfo("pipwerks.SCORM.set(" +parameter +") failed. \n"
                                  +"Error code: " +errorCode +"\n"
                                  +"Error info: " +debugInfo);
            }
        } else {
            __displayDebugInfo("pipwerks.SCORM.set(" +parameter +") failed: connection is inactive.");
        }
        return result;
    }


    private function __save():Boolean {

        var result:Boolean = false;
        if(__connectionActive){
            var eiCall:String = String(ExternalInterface.call("pipwerks.SCORM.save"));
            result = __stringToBoolean(eiCall);
            if(!result){
                var errorCode:Number = __getDebugCode();
                var debugInfo:String = __getDebugInfo(errorCode);
                __displayDebugInfo("pipwerks.SCORM.save() failed. \n"
                                  +"Error code: " +errorCode +"\n"
                                  +"Error info: " +debugInfo);
            }
        } else {
            __displayDebugInfo("pipwerks.SCORM.save() failed: API connection is inactive.");
        }
        return result;
    }


    // --- debug functions ----------------------------------------------- //

    private function __getDebugCode():Number {
        var code:Number = Number(ExternalInterface.call("pipwerks.SCORM.debug.getCode"));
        return code;
    }

    private function __getDebugInfo(errorCode:Number):String {
        var result:String = String(ExternalInterface.call("pipwerks.SCORM.debug.getInfo", errorCode));
        return result;
    }

    private function __getDiagnosticInfo(errorCode:Number):String {
        var result:String = String(ExternalInterface.call("pipwerks.SCORM.debug.getDiagnosticInfo", errorCode));
        return result;
    }

    private function __displayDebugInfo(msg:String):Void {
        if(__debugActive){
            trace(msg);
            ExternalInterface.call("pipwerks.UTILS.trace", msg);
        }
    }

    //Purposely not typing the variable 'value'
    private function __stringToBoolean(value):Boolean {

        var t:String = typeof value;

        switch(t){

           case "boolean": return value;
           case "number": return !!value;
           case "undefined": return null;
           case "string":
                var str:String = value.toLowerCase();
                return (str === "true" || str === "1");

           default: return false;

        }

    }

} // end SCORM class