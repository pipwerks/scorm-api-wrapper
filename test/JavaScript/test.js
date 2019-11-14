QUnit.test("csToISODuration", function (assert){

    assert.equal(pipwerks.UTILS.csToISODuration(100), 'PT1S', 'check result for 1 second');
    assert.equal(pipwerks.UTILS.csToISODuration(100 * 61), 'PT1M1S', 'check result for 1 minute and 1 second');
    assert.equal(pipwerks.UTILS.csToISODuration(100 * 60 * 15), 'PT15M', 'check result for 15 minutes');
    assert.equal(pipwerks.UTILS.csToISODuration(100 * 60 * 90), 'PT1H30M', 'check result for 1 hour and 30 minutes');
    assert.equal(pipwerks.UTILS.csToISODuration(100 * 60 * 60 * 24 + 100 * 60 * 37 + 100 * 25), 'P1DT37M25S', 'check result for 1 day 37 minutes and 25 seconds');
    assert.equal(pipwerks.UTILS.csToISODuration(), 'PT0H0M0S', 'check no arguments is correctly handled');
    assert.equal(pipwerks.UTILS.csToISODuration(undefined), 'PT0H0M0S', 'check undefined is correctly handled');
    assert.equal(pipwerks.UTILS.csToISODuration(null), 'PT0H0M0S', 'check null is correctly handled');
    assert.equal(pipwerks.UTILS.csToISODuration(''), 'PT0H0M0S', 'check string is correctly handled');
    assert.equal(pipwerks.UTILS.csToISODuration(0), 'PT0H0M0S', 'check 0 is correctly handled');
    assert.equal(pipwerks.UTILS.csToISODuration(-1), 'PT0H0M0S', 'check negative numbers are correctly handled');

});

QUnit.test("msToCMIDuration", function (assert) {

    assert.equal(pipwerks.UTILS.msToCMIDuration(1000), '00:00:01', 'check result for 1 second');
    assert.equal(pipwerks.UTILS.msToCMIDuration(1000 * 61), '00:01:01', 'check result for 1 minute and 1 second');
    assert.equal(pipwerks.UTILS.msToCMIDuration(1000 * 60 * 15), '00:15:00', 'check result for 15 minutes');
    assert.equal(pipwerks.UTILS.msToCMIDuration(1000 * 60 * 90), '01:30:00', 'check result for 1 hour and 30 minutes');
    assert.equal(pipwerks.UTILS.msToCMIDuration(1000 * 60 * 60 * 24 + 1000 * 60 * 37 + 1000 * 25), '24:37:25', 'check result for 1 day 37 minutes and 25 seconds');
    assert.equal(pipwerks.UTILS.msToCMIDuration(), '00:00:00', 'check no arguments is correctly handled');
    assert.equal(pipwerks.UTILS.msToCMIDuration(undefined), '00:00:00', 'check undefined is correctly handled');
    assert.equal(pipwerks.UTILS.msToCMIDuration(null), '00:00:00', 'check null is correctly handled');
    assert.equal(pipwerks.UTILS.msToCMIDuration(''), '00:00:00', 'check string is correctly handled');
    assert.equal(pipwerks.UTILS.msToCMIDuration(0), '00:00:00', 'check 0 is correctly handled');
    assert.equal(pipwerks.UTILS.msToCMIDuration(-1), '00:00:00', 'check negative numbers are correctly handled');

});