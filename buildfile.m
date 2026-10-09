function plan = buildfile
import matlab.buildtool.tasks.*

plan = buildplan(localfunctions);

addpath("source")

plan("clean") = CleanTask;
plan("check") = CodeIssuesTask(Results="code-issues/results.sarif");
plan("test") = TestTask("tests", ...
    SourceFiles="source", ...
    TestResults="test-results/results.xml", ...
    CodeCoverageResults="code-coverage/results.xml");

plan("generate").Inputs = "source/*.m";
plan("generate").Outputs = "output/report.txt";
plan("test").Dependencies = "generate";
plan.DefaultTasks = ["check" "test"];
end

function generateTask(~)
if ~isfolder("output")
    mkdir("output");
end
generateReport();
end
