== PREPARE

ant hstore-prepare -Dproject=twitter -Dhosts="istc9:0:0-5;istc10:1:6-11;istc11:2:12-17;istc12:3:18-23"

== LOAD

ant hstore-benchmark -Dproject=twitter -Dglobal.hasher_plan=plan.json -Dglobal.hasher_class=edu.brown.hashing.TwoTieredRangeHasher -Dnoshutdown=true -Dnoexecute=true -Dsite.txn_restart_limit_sysproc=100 -Dsite.jvm_asserts=false -Dsite.commandlog_enable=false -Dsite.exec_db2_redirects=false -Dsite.exec_early_prepare=false -Dsite.exec_force_singlepartitioned=true -Dsite.markov_fixed=false -Dsite.planner_caching=false -Dsite.specexec_enable=true -Dglobal.memory=50240 -Dclient.memory=50240 -Dsite.memory=50240 | tee out-load.log

== RUN

ant hstore-benchmark -Dproject=twitter -Dglobal.hasher_plan=plan.json -Dglobal.hasher_class=edu.brown.hashing.TwoTieredRangeHasher -Dnostart=true -Dnoloader=true -Dnoshutdown=true -Dclient.duration=60000 -Dclient.interval=1000 -Dclient.txnrate=1000 -Dclient.count=5 -Dclient.hosts="istc9;istc10;istc11;istc12;istc13" -Dclient.threads_per_host=16 -Dclient.blocking_concurrent=30 -Dclient.output_results_csv=results.csv -Dclient.output_interval=true -Dsite.planner_caching=false -Dclient.txn_hints=false -Dsite.exec_early_prepare=false -Dclient.output_basepartitions=true -Dglobal.memory=50240 -Dclient.memory=50240 -Dsite.memory=50240 | tee out.log

== LOAD from plan_out.json

ant hstore-benchmark -Dproject=twitter -Dglobal.hasher_plan=plan_out.json -Dglobal.hasher_class=edu.brown.hashing.TwoTieredRangeHasher -Dnoshutdown=true -Dnoexecute=true -Dsite.txn_restart_limit_sysproc=100 -Dsite.jvm_asserts=false -Dsite.commandlog_enable=false -Dsite.exec_db2_redirects=false -Dsite.exec_early_prepare=false -Dsite.exec_force_singlepartitioned=true -Dsite.markov_fixed=false -Dsite.planner_caching=false -Dsite.specexec_enable=true -Dglobal.memory=50240 -Dclient.memory=50240 -Dsite.memory=50240 | tee out-load.log

== RUN from plan_out.json 

ant hstore-benchmark -Dproject=twitter -Dglobal.hasher_plan=plan_out.json -Dglobal.hasher_class=edu.brown.hashing.TwoTieredRangeHasher -Dnostart=true -Dnoloader=true -Dnoshutdown=true -Dclient.duration=60000 -Dclient.interval=1000 -Dclient.txnrate=1000 -Dclient.count=5 -Dclient.hosts="istc9;istc10;istc11;istc12;istc13" -Dclient.threads_per_host=16 -Dclient.blocking_concurrent=30 -Dclient.output_results_csv=results.csv -Dclient.output_interval=true -Dsite.planner_caching=false -Dclient.txn_hints=false -Dsite.exec_early_prepare=false -Dclient.memory=4096 -Dclient.output_basepartitions=true -Dglobal.memory=50240 -Dclient.memory=50240 -Dsite.memory=50240 | tee out.log


== MONITOR

ant hstore-benchmark -Dproject=twitter -Dglobal.hasher_plan=plan.json -Dglobal.hasher_class=edu.brown.hashing.TwoTieredRangeHasher -Dnostart=true -Dnoloader=true -Dnoshutdown=true -Dclient.interval=1000 -Dclient.txnrate=1000 -Dclient.count=5 -Dclient.hosts="istc9;istc10;istc11;istc12;istc13" -Dclient.threads_per_host=16 -Dclient.blocking_concurrent=30 -Dclient.output_results_csv=results.csv -Dclient.output_interval=true -Dsite.planner_caching=false -Dclient.txn_hints=false -Dsite.exec_early_prepare=false -Delastic.run_monitoring=true -Delastic.update_plan=false -Delastic.exec_reconf=false -Delastic.delay=20000 -Dclient.duration=60000 -Dglobal.memory=50240 -Dclient.memory=50240 -Dsite.memory=50240 | tee -a out.log

== RECONFIGURE

ant hstore-benchmark -Dproject=twitter -Dglobal.hasher_plan=plan.json -Dglobal.hasher_class=edu.brown.hashing.TwoTieredRangeHasher -Dnoshutdown=true -Dclient.duration=1200000 -Dclient.interval=1000 -Dclient.txnrate=1000 -Dclient.count=5 -Dclient.hosts="istc9;istc10;istc11;istc12;istc13" -Dclient.threads_per_host=16 -Dclient.blocking_concurrent=30 -Dclient.output_results_csv=results.csv -Dclient.output_interval=true -Dsite.planner_caching=false -Dclient.txn_hints=false -Dsite.exec_early_prepare=false -Dclient.output_basepartitions=true -Delastic.run_monitoring=false -Delastic.update_plan=false -Delastic.exec_reconf=true -Delastic.delay=20000 -Dglobal.memory=50240 -Dclient.memory=50240 -Dsite.memory=50240 | tee out.log
