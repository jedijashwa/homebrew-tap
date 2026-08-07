cask "pullmark@beta" do
  version "0.28.0-beta.5"
  sha256 "5b214e6ecf900601a12a1d2a58b198a8cb3ecb60e02f77d03a1dec581541d8b4"

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
