################################################################################
# DuckDB-Wasm extension base config
################################################################################
#
duckdb_extension_load(json DONT_LINK)
duckdb_extension_load(parquet DONT_LINK)
duckdb_extension_load(autocomplete DONT_LINK)

duckdb_extension_load(excel DONT_LINK)
duckdb_extension_load(fts DONT_LINK)
duckdb_extension_load(inet DONT_LINK)
duckdb_extension_load(icu DONT_LINK)
duckdb_extension_load(sqlsmith DONT_LINK)
duckdb_extension_load(tpcds DONT_LINK)
duckdb_extension_load(tpch DONT_LINK)

duckdb_extension_load(pbix
    (DONT_LINK)
    SOURCE_DIR /home/boom/git/hub/duckdb-pbix-extension/src
    (INCLUDE_DIR /home/boom/git/hub/duckdb-pbix-extension/src/include)
)

#duckdb_extension_load(httpfs DONT_LINK)
