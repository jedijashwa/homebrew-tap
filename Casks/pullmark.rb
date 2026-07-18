cask "pullmark" do
  version "0.2.0"
  sha256 "e0b790860d62ee76f2df86009cc3463631f88cdc189edc36c17234f21ec8b10a"

  url "https://github.com/jedijashwa/pullmark/releases/download/v#{version}/PullMark-#{version}.zip"
  name "PullMark"
  desc "Markdown viewer and rendered-diff reviewer for documentation-heavy GitHub PRs"
  homepage "https://github.com/jedijashwa/pullmark"

  depends_on macos: ">= :ventura"

  app "PullMark.app"

  zap trash: "~/Library/Preferences/app.pullmark.PullMark.plist"
end
