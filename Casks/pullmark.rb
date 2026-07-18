cask "pullmark" do
  version "0.1.0"
  sha256 "dcc1641479855c86a98a699b809ff172aee77d908d1d4cde3ae3033bcbd05a39"

  url "https://github.com/jedijashwa/pullmark/releases/download/v#{version}/PullMark-#{version}.zip"
  name "PullMark"
  desc "Markdown viewer and rendered-diff reviewer for documentation-heavy GitHub PRs"
  homepage "https://github.com/jedijashwa/pullmark"

  depends_on macos: ">= :ventura"

  app "PullMark.app"

  caveats <<~EOS
    PullMark is ad-hoc signed (not notarized). If macOS blocks the first
    launch, right-click PullMark.app and choose Open, or allow it in
    System Settings > Privacy & Security.
  EOS

  zap trash: "~/Library/Preferences/app.pullmark.PullMark.plist"
end
