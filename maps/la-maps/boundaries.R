# get table of all area collections
# don't scrape http://statistics.data.gov.uk listings as not nested
# it uses <li class="header" /> nodes which suck
# just cheat and clone the repo at openregister/statistical-geography-data
# via: git@github.com:openregister/statistical-geography-data.git
area.collections <- read.csv('../stat-geo-data/data/statistical-geography/statistical-geography.tsv',
                             sep='\t')[1:2]

# ONS area collection :: 01 :: "All Super Output Areas, Lower Layer (32,844 total)"
# do not get

# ONS area collection :: 05 :: ""

# get ONS area collection :: 09 :: "All London Boroughs (33 total)"
ons.la.json.url <- "http://statistics.data.gov.uk/area_collection.jsonld?in_collection=http%3A%2F%2Fstatistics.data.gov.uk%2Fdef%2Fgeography%2Fcollection%2FE09"
ons.la.areas <- jsonlite::read_json(paste0(ons.la.json.url,'&per_page=200'))
# length(ons.la.areas)
# [1] 33