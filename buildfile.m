function plan = buildfile
import matlab.buildtool.tasks.*
import matlab.buildtool.Task;

plan = buildplan(localfunctions);

addpath("source")

plan("clean") = CleanTask;
plan("check") = CodeIssuesTask(Results="code-issues/results.sarif");
plan("test") = TestTask("tests", ...
    SourceFiles="source", ...
    TestResults="test-results/results.xml", ...
    CodeCoverageResults="code-coverage/results.xml");
plan("newTask") = Task();

plan.DefaultTasks = ["check" "test"];
end
