QUnit.test("csToISODuration", function (assert){

    var t1 = 1513937992632;
    var t2 = 1513938095752;
    var d = t2 - t1;

    assert.equal(pipwerks.UTILS.csToISODuration(d), 'PT17M11.2S');
    assert.equal(pipwerks.UTILS.csToISODuration(), 'PT0H0M0S');
    assert.equal(pipwerks.UTILS.csToISODuration(undefined), 'PT0H0M0S');
    assert.equal(pipwerks.UTILS.csToISODuration(null), 'PT0H0M0S');
    assert.equal(pipwerks.UTILS.csToISODuration(''), 'PT0H0M0S');
    assert.equal(pipwerks.UTILS.csToISODuration(0), 'PT0H0M0S');
    assert.equal(pipwerks.UTILS.csToISODuration(-1), 'PT0H0M0S');

});

QUnit.test("msToCMIDuration", function (assert) {

    var t1 = 1513937992632;
    var t2 = 1513938095752;
    var d = t2 - t1;

    assert.equal(pipwerks.UTILS.msToCMIDuration(d), '00:01:43');
    assert.equal(pipwerks.UTILS.msToCMIDuration(), '00:00:00');
    assert.equal(pipwerks.UTILS.msToCMIDuration(undefined), '00:00:00');
    assert.equal(pipwerks.UTILS.msToCMIDuration(null), '00:00:00');
    assert.equal(pipwerks.UTILS.msToCMIDuration(''), '00:00:00');
    assert.equal(pipwerks.UTILS.msToCMIDuration(0), '00:00:00');
    assert.equal(pipwerks.UTILS.msToCMIDuration(-1), '00:00:00');

});