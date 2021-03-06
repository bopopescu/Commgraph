/* This file is part of VoltDB.
 * Copyright (C) 2008-2010 VoltDB Inc.
 *
 * VoltDB is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * VoltDB is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with VoltDB.  If not, see <http://www.gnu.org/licenses/>.
 */

#ifndef PERSISTENTTUPLESTATS_H_
#define PERSISTENTTUPLESTATS_H_

#include "storage/TupleStats.h"
#include <vector>
#include <string>

namespace voltdb {
class PersistentTable;

/**
 * Further specialization of TupleStats that currently adds no extra functionality.
 * Essam
 */
class PersistentTupleStats : public voltdb::TupleStats {
  public:
    PersistentTupleStats(voltdb::PersistentTable* table);
  protected:
    virtual std::vector<std::string> generateStatsColumnNames();
};

}

#endif /* PERSISTENTTUPLESTATS_H_ */
