QUnit.test("centisecsToISODuration", function (assert){

    var t1 = 1513937992632;
    var t2 = 1513938095752;
    var d = t2 - t1;

    assert.equal(pipwerks.UTILS.centisecsToISODuration(d), 'PT17M11.2S');
    assert.equal(pipwerks.UTILS.centisecsToISODuration(), 'PT0H0M0S');
    assert.equal(pipwerks.UTILS.centisecsToISODuration(undefined), 'PT0H0M0S');
    assert.equal(pipwerks.UTILS.centisecsToISODuration(null), 'PT0H0M0S');
    assert.equal(pipwerks.UTILS.centisecsToISODuration(''), 'PT0H0M0S');
    assert.equal(pipwerks.UTILS.centisecsToISODuration(0), 'PT0H0M0S');

});

QUnit.test("MillisecondsToCMIDuration", function (assert) {

    var t1 = 1513937992632;
    var t2 = 1513938095752;
    var d = t2 - t1;

    assert.equal(pipwerks.UTILS.MillisecondsToCMIDuration(d), '00:01:43');
    assert.equal(pipwerks.UTILS.MillisecondsToCMIDuration(), '00:00:00');
    assert.equal(pipwerks.UTILS.MillisecondsToCMIDuration(undefined), '00:00:00');
    assert.equal(pipwerks.UTILS.MillisecondsToCMIDuration(null), '00:00:00');
    assert.equal(pipwerks.UTILS.MillisecondsToCMIDuration(''), '00:00:00');
    assert.equal(pipwerks.UTILS.MillisecondsToCMIDuration(0), '00:00:00');

});