desc "Builds Carthage dependencies without updating"
task :cartbuild do
    sh "carthage build --platform iOS --no-use-binaries"
end

desc "Updates and builds Carthage dependencies"
task :cartupdate do
    sh "carthage update --platform iOS --no-use-binaries"
end