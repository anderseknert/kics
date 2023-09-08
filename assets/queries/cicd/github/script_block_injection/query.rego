package Cx

import data.generic.common as common_lib

CxPolicy[result] {

	input.document[i].on["pull_request_target"]

    uses := input.document[i].jobs[j].steps[k].uses

    startswith(uses,"actions/github-scripts")

    script := input.document[i].jobs[j].steps[k].with["script"]

	patterns := [
    "github.head_ref",
    "github.event.pull_request.body",
    "github.event.pull_request.head.label",
    "github.event.pull_request.head.ref",
    "github.event.pull_request.head.repo.default_branch",
    "github.event.pull_request.head.repo.description",
    "github.event.pull_request.head.repo.homepage",
    "github.event.pull_request.title"
	]

	containsPattern(script, patterns)

	result := {
		"documentId": input.document[i].id,
		"searchKey": sprintf("script={{%s}}", [script]),
		"issueType": "IncorrectValue",
		"keyExpectedValue": "Script block does not contain dangerous input controlled by user.",
		"keyActualValue": "Script block contains dangerous input controlled by user.",
		"searchLine": common_lib.build_search_line(["jobs", j, "steps", k, "with", "script"],[])
	}
}

CxPolicy[result] {

	input.document[i].on["issues"]
	script := input.document[i].jobs[j].steps[k].run

	patterns := [
    "github.event.issue.body",
	"github.event.issue.title"
	]

	containsPattern(script, patterns)

	result := {
		"documentId": input.document[i].id,
		"searchKey": sprintf("script={{%s}}", [script]),
		"issueType": "IncorrectValue",
		"keyExpectedValue": "Script block does not contain dangerous input controlled by user.",
		"keyActualValue": "Script block contains dangerous input controlled by user.",
		"searchLine": common_lib.build_search_line(["jobs", j, "steps", k, "script"],[])
	}
}

CxPolicy[result] {

	input.document[i].on["issue_comment"]
	script := input.document[i].jobs[j].steps[k].run

	patterns := [
    "github.event.comment.body",
	"github.event.issue.body",
	"github.event.issue.title"
	]

	containsPattern(script, patterns)

	result := {
		"documentId": input.document[i].id,
		"searchKey": sprintf("script={{%s}}", [script]),
		"issueType": "IncorrectValue",
		"keyExpectedValue": "Script block does not contain dangerous input controlled by user.",
		"keyActualValue": "Script block contains dangerous input controlled by user.",
		"searchLine": common_lib.build_search_line(["jobs", j, "steps", k, "script"],[])
	}
}

CxPolicy[result] {

	input.document[i].on["discussion"]
	script := input.document[i].jobs[j].steps[k].run

	patterns := [
    "github.event.discussion.body",
	"github.event.discussion.title"
	]

	containsPattern(script, patterns)

	result := {
		"documentId": input.document[i].id,
		"searchKey": sprintf("script={{%s}}", [script]),
		"issueType": "IncorrectValue",
		"keyExpectedValue": "Script block does not contain dangerous input controlled by user.",
		"keyActualValue": "Script block contains dangerous input controlled by user.",
		"searchLine": common_lib.build_search_line(["jobs", j, "steps", k, "script"],[])
	}
}

CxPolicy[result] {

	input.document[i].on["discussion_comment"]
	script := input.document[i].jobs[j].steps[k].run

	patterns := [
    "github.event.comment.body",
	"github.event.discussion.body",
	"github.event.discussion.title"
	]

	containsPattern(script, patterns)

	result := {
		"documentId": input.document[i].id,
		"searchKey": sprintf("script={{%s}}", [script]),
		"issueType": "IncorrectValue",
		"keyExpectedValue": "Script block does not contain dangerous input controlled by user.",
		"keyActualValue": "Script block contains dangerous input controlled by user.",
		"searchLine": common_lib.build_search_line(["jobs", j, "steps", k, "script"],[])
	}
}

CxPolicy[result] {

	input.document[i].on["workflow_run"]
	script := input.document[i].jobs[j].steps[k].run

	patterns := [
    "github.event.workflow.path",
	"github.event.workflow_run.head_branch",
	"github.event.workflow_run.head_commit.author.email",
	"github.event.workflow_run.head_commit.author.name",
	"github.event.workflow_run.head_commit.message",
	"github.event.workflow_run.head_repository.description"
	]

	containsPattern(script, patterns)

	result := {
		"documentId": input.document[i].id,
		"searchKey": sprintf("script={{%s}}", [script]),
		"issueType": "IncorrectValue",
		"keyExpectedValue": "Script block does not contain dangerous input controlled by user.",
		"keyActualValue": "Script block contains dangerous input controlled by user.",
		"searchLine": common_lib.build_search_line(["jobs", j, "steps", k, "script"],[])
	}
}

CxPolicy[result] {

	input.document[i].on["author"]
	script := input.document[i].jobs[j].steps[k].run

	patterns := [
    "github.*.authors.name",
	"github.*.authors.email"
	]

	containsPattern(script, patterns)

	result := {
		"documentId": input.document[i].id,
		"searchKey": sprintf("script={{%s}}", [script]),
		"issueType": "IncorrectValue",
		"keyExpectedValue": "Script block does not contain dangerous input controlled by user.",
		"keyActualValue": "Script block contains dangerous input controlled by user.",
		"searchLine": common_lib.build_search_line(["jobs", j, "steps", k, "script"],[])
	}
}



containsPattern(str, patterns) {
    pattern := patterns[_]
    regex.match(pattern, str)
}

