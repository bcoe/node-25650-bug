workflow "Candidate Issue" {
  on = "schedule(*/5 * * * *)"
  resolves = ["candidate-issue"]
}

action "candidate-issue" {
  uses = "googleapis/release-please/.github/action/release-please@master"
  env = {
    PACKAGE_NAME = "25650-bug"
    RELEASE_PLEASE_COMMAND = "candidate-issue"
  }
  secrets = ["GITHUB_TOKEN"]
}

workflow "GitHub Release" {
  on = "push"
  resolves = ["github-release"]
}

action "github-release" {
  uses = "googleapis/release-please/.github/action/release-please@master"
  env = {
    PACKAGE_NAME = "25650-bug"
    RELEASE_PLEASE_COMMAND = "github-release"
  }
  secrets = ["GITHUB_TOKEN"]
}
