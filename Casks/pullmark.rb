cask "pullmark" do
  version "0.36.0"
  sha256 "063be7fd30dd3e947da7ac9a0406d3eb1309d5560e827cd9fae0ccbdc1294f53"

  url "https://github.com/jedijashwa/pullmark/releases/download/v#{version}/PullMark-#{version}.zip"
  name "PullMark"
  desc "Markdown viewer and rendered-diff reviewer for documentation-heavy GitHub PRs"
  homepage "https://github.com/jedijashwa/pullmark"

  depends_on macos: :ventura

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
