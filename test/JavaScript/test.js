QUnit.test("centisecsToISODuration", function (assert){

    var t1 = 1513937992632;
    var t2 = 1513938095752;
    var d = t2 - t1;

    assert.equal(pipwerks.UTILS.centisecsToISODuration(d), 'PT17M11.2S');

});

QUnit.test("MillisecondsToCMIDuration", function (assert) {

    var t1 = 1513937992632;
    var t2 = 1513938095752;
    var d = t2 - t1;

    assert.equal(pipwerks.UTILS.MillisecondsToCMIDuration(d), '00:01:43');

});