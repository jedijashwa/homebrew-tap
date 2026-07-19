cask "pullmark" do
  version "0.6.0"
  sha256 "a35e882e17b7764c23f114a9b15eaf9ff4d60600f31e88d802807776d025d379"

  url "https://github.com/jedijashwa/pullmark/releases/download/v#{version}/PullMark-#{version}.zip"
  name "PullMark"
  desc "Markdown viewer and rendered-diff reviewer for documentation-heavy GitHub PRs"
  homepage "https://github.com/jedijashwa/pullmark"

  depends_on macos: ">= :ventura"

  app "PullMark.app"

  zap trash: "~/Library/Preferences/app.pullmark.PullMark.plist"
end
