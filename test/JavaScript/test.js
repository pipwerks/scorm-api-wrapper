var assert = require('assert');
var pipwerks = require('../../src/JavaScript/SCORM_API_wrapper.js');

try{

    let t1 = 1513937992632;
    let t2 = 1513938095752;
    let d = t2 - t1;

    assert.equal(pipwerks.UTILS.centisecsToISODuration(d),'PT17M11.2S');
    assert.equal(pipwerks.UTILS.MillisecondsToCMIDuration(d),'00:01:43');

    console.log('All tests passed!');

}
catch(e){
    console.log(e);
}