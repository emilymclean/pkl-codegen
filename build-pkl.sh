pkl eval .github/workflows/src/build.pkl -f yaml -o .github/workflows/build.yml
pkl eval .github/workflows/src/test.pkl -f yaml -o .github/workflows/test.yml
pkl eval .github/workflows/src/pkl-update.pkl -f yaml -o .github/workflows/pkl-update.yml
pkl eval .github/workflows/src/swift-tool-update.pkl -f yaml -o .github/workflows/swift-tool-update.yml
pkl eval .github/workflows/src/go-tool-update.pkl -f yaml -o .github/workflows/go-tool-update.yml