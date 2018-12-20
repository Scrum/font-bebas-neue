workflow "workflow" {
  on = "push"
  resolves = ["GitHub Action for Zeit"]
}

action "GitHub Action for npm" {
  uses = "actions/npm@e7aaefe"
  secrets = ["GITHUB_TOKEN"]
  runs = "npm test"
}

action "GitHub Action for Zeit" {
  uses = "actions/zeit-now@9fe84d5"
  needs = ["GitHub Action for npm"]
  runs = "now docs"
  secrets = ["GITHUB_TOKEN"]
}
