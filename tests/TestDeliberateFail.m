classdef TestDeliberateFail < matlab.unittest.TestCase
    methods (Test)
        function testShouldFail(testCase)
            testCase.verifyEqual(1, 2, "Deliberate failure to test cache behavior");
        end
    end
end
