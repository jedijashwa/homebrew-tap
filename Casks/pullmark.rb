cask "pullmark" do
  version "0.7.0"
  sha256 "32244a5fe6060f9478dba81a7dcbe4538de0fa48b29031e264f8fa76089b4876"

  url "https://github.com/jedijashwa/pullmark/releases/download/v#{version}/PullMark-#{version}.zip"
  name "PullMark"
  desc "Markdown viewer and rendered-diff reviewer for documentation-heavy GitHub PRs"
  homepage "https://github.com/jedijashwa/pullmark"

  depends_on macos: ">= :ventura"

  app "PullMark.app"

  zap trash: "~/Library/Preferences/app.pullmark.PullMark.plist"
end
