cask "pullmark@beta" do
  version "0.28.0-beta.2"
  sha256 "a670f20f895ac6bb358502ff55a94e55622c4cc0fa480c47a68f75a8bccf3b33"

  url "https://github.com/jedijashwa/pullmark/releases/download/v#{version}/PullMark-#{version}.zip"
  name "PullMark Beta"
  desc "Markdown viewer and rendered-diff reviewer for documentation-heavy GitHub PRs (beta channel)"
  homepage "https://github.com/jedijashwa/pullmark"

  depends_on macos: ">= :ventura"
  conflicts_with cask: "pullmark"

  app "PullMark.app"
  # The pullmark shell command ships inside the bundle (0.25.0+).
  binary "#{appdir}/PullMark.app/Contents/Resources/pullmark"

  # Re-register the app and its Quick Look extension after every install and
  # upgrade: the delete-and-replace swap can drop the pluginkit registration,
  # leaving space-bar previews showing raw text until the app is launched.
  postflight do
    system_command "/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister",
                   args: ["-f", "#{appdir}/PullMark.app"]
    system_command "/usr/bin/pluginkit",
                   args: ["-a", "#{appdir}/PullMark.app/Contents/PlugIns/PullMarkQuickLook.appex"]
  end

  zap trash: "~/Library/Preferences/app.pullmark.PullMark.plist"
end
