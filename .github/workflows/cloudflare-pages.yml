name: 'Cloudflare Pages Deployment'
on:
    push:
        branches:
            - main
jobs:
    build_and_deploy:
        runs-on: ubuntu-latest
        steps:
            - name: Checkout repository
              uses: actions/checkout@v2
              with:
                  submodules: 'recursive'
                  fetch-depth: 0

            - name: Set up Node.js
              uses: actions/setup-node@v2
              with:
                  node-version: 18

            - name: Setup CCache
              uses: hendrikmuhs/ccache-action@main
              with:
                  key: ${{ github.job }}

            - name: Prepare repository
              run: |
                  git fetch --tags --no-recurse-submodules -f
                  (cd ./submodules/duckdb && git fetch --all --tags)

            - name: Install dependencies
              run: yarn install --frozen-lockfile --prefer-offline

            - name: Build @duckdb/duckdb-wasm
              shell: bash
              run: |
                  rm -rf ./packages/duckdb-wasm/dist/
                  yarn workspace @duckdb/duckdb-wasm build:release
                  yarn workspace @duckdb/duckdb-wasm docs

            - name: Build @duckdb/duckdb-wasm-shell
              shell: bash
              run: |
                  rm -rf ./packages/duckdb-wasm-shell/dist/
                  yarn workspace @duckdb/duckdb-wasm-shell install:wasmpack
                  yarn workspace @duckdb/duckdb-wasm-shell build:release

            - name: Build @duckdb/duckdb-wasm-app
              shell: bash
              run: |
                  rm -rf ./packages/duckdb-wasm-app/build/
                  yarn workspace @duckdb/duckdb-wasm-app build:release

            - name: Deploy to Cloudflare Pages
              uses: cloudflare/pages-action@v1
              with:
                  apiToken: ${{ secrets.CF_API_TOKEN }}
                  accountId: ${{ secrets.CF_ACCOUNT_ID }}
                  projectName: shell-duckdb-pbix
                  directory: ./build/release
