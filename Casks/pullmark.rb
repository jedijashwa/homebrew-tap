cask "pullmark" do
  version "0.25.0"
  sha256 "a0303d189b0c33682ef29e9d9619fdfa7356b23c9d81630d2e3f5469843368c3"

  url "https://github.com/jedijashwa/pullmark/releases/download/v#{version}/PullMark-#{version}.zip"
  name "PullMark"
  desc "Markdown viewer and rendered-diff reviewer for documentation-heavy GitHub PRs"
  homepage "https://github.com/jedijashwa/pullmark"

  depends_on macos: ">= :ventura"

  app "PullMark.app"

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
