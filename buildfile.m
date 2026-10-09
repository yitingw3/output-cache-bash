function plan = buildfile
import matlab.buildtool.tasks.*

plan = buildplan(localfunctions);

addpath("source")

plan("clean") = CleanTask;
plan("check") = CodeIssuesTask(Results="code-issues/results.sarif");
plan("generate") = generateTask();
plan("test") = TestTask("tests", ...
    SourceFiles="source", ...
    TestResults="test-results/results.xml", ...
    CodeCoverageResults="code-coverage/results.xml");

plan("test").Dependencies = "generate";
plan.DefaultTasks = ["check" "test"];
end

function task = generateTask()
import matlab.buildtool.Task
task = Task( ...
    Description="Generate report from dayofyear calculations", ...
    Actions=@generate, ...
    Inputs="source/*.m", ...
    Outputs="output/report.txt");
end

function generate(~)
if ~isfolder("output")
    mkdir("output");
end
generateReport();
end
