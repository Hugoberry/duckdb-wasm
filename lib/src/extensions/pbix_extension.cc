#include "duckdb/web/extensions/pbix_extension.h"

#include "pbix_extension.hpp"

extern "C" void duckdb_web_pbix_init(duckdb::DuckDB* db) { db->LoadExtension<duckdb::PbixExtension>(); }
