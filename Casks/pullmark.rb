cask "pullmark" do
  version "0.8.0"
  sha256 "989bebadb2c7a501cf354ceb0a04a96cd7af83c85deec637e08491429c569eed"

  url "https://github.com/jedijashwa/pullmark/releases/download/v#{version}/PullMark-#{version}.zip"
  name "PullMark"
  desc "Markdown viewer and rendered-diff reviewer for documentation-heavy GitHub PRs"
  homepage "https://github.com/jedijashwa/pullmark"

  depends_on macos: ">= :ventura"

  app "PullMark.app"

  zap trash: "~/Library/Preferences/app.pullmark.PullMark.plist"
end
