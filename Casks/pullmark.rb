cask "pullmark" do
  version "0.7.1"
  sha256 "240a35cb4e2a8431d1ecf9b3fa76b6f5f1028e65c92f20ff4ad400bdd1085571"

  url "https://github.com/jedijashwa/pullmark/releases/download/v#{version}/PullMark-#{version}.zip"
  name "PullMark"
  desc "Markdown viewer and rendered-diff reviewer for documentation-heavy GitHub PRs"
  homepage "https://github.com/jedijashwa/pullmark"

  depends_on macos: ">= :ventura"

  app "PullMark.app"

  zap trash: "~/Library/Preferences/app.pullmark.PullMark.plist"
end
